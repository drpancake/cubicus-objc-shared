//
//  CBAppClient.m
//  Cubicus
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBAppClient.h"
#import "CBContext.h"
#import "CBLayout.h"

@implementation CBAppClient

@synthesize applicationName;
@synthesize currentContextID;

- (id)initWithHost:(CBHost *)theHost applicationName:(NSString *)theApplicationName;
{
    self = [super initWithHost:theHost];
    if (self) {
        _managers = [[NSMutableArray alloc] init];
        _defaultContextID = -1;
        applicationName = theApplicationName;
    }
    return self;
}

- (void)addContextManager:(CBContextManager *)manager
{
    [self addContextManager:manager defaultContext:NO];
}

- (void)addContextManager:(CBContextManager *)manager defaultContext:(BOOL)isDefault
{
    [_managers addObject:manager];
    
    // Give the manager a reference to this CBAppClient so it
    // can listen for state switches via KVO
    manager.client = self;
    
    if (isDefault == YES) {
        _defaultContextID = manager.context.contextID;
        self.currentContextID = [NSNumber numberWithInt:_defaultContextID];
    }
}

#pragma mark -
#pragma mark Messages

- (void)switchContext:(NSUInteger)contextID
{
    self.currentContextID = [NSNumber numberWithInt:contextID];
    [self sendMessage:@"switch_context" content:self.currentContextID];
}

- (void)sendEvent:(CBEvent *)event
{
    NSLog(@"sending event; %@", event);
    [self sendMessage:@"event" content:[event toJSON]];
}

- (void)sendBecameActive
{
    [self sendMessage:@"became_active" content:nil];
}

#pragma mark -
#pragma mark AsyncSocketDelegate

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    [super onSocket:sock didConnectToHost:host port:port];
    
    // Step 1: send 'application_identify' message
    
    // Serialize contexts to JSON
    NSMutableArray *contexts = [[NSMutableArray alloc] initWithCapacity:[_managers count]];
    for (CBContextManager *manager in _managers) {
        [contexts addObject:[manager.context toJSON]];
    }
    
    NSMutableDictionary *content = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    self.applicationName, @"name", contexts, @"contexts", nil];
    if (_defaultContextID != -1) {
        [content setObject:[NSNumber numberWithInt:_defaultContextID] forKey:@"default_context"];
    }
         
    [self sendMessage:@"application_identify"
              content:[NSDictionary dictionaryWithDictionary:content]
                  tag:CBAppClientTagIdentify];
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    [super onSocket:sock didWriteDataWithTag:tag];
    
    switch (tag) {
        case CBAppClientTagIdentify:
            // Step 2. wait for arbitrary events
            [self readMessage];
            break;
            
        default:
            NSLog(@"Unknown write tag: %li", tag);
            break;
    }
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    [super onSocket:sock didReadData:data withTag:tag];
    
    // Decode
    NSDictionary *msg = (NSDictionary *)[self.parser objectWithData:data]; // assumes UTF-8
    NSString *type = [msg objectForKey:@"type"];
    id content = [msg objectForKey:@"content"];
    
    NSLog(@"Received message type: %@", type);
    
    if ([type isEqualToString:@"switch_context"]) {
        // Set current context ID, triggering KVO notifications
        self.currentContextID = (NSNumber *)content;
        
    } else if ([type isEqualToString:@"event"]) {
        // Deserialize and send to the intended context manager
        CBEvent *event = [CBEvent fromJSON:(NSDictionary *)content];
        for (CBContextManager *manager in _managers) {
            if (manager.context.contextID == event.contextID) {
                [manager sender:self didFireEvent:event];
                break;
            }
        }
        
    } else if ([type isEqualToString:@"become_active"]) {
        // TODO: create a CBAppClientDelegate that gets notified at this point
        [NSApp activateIgnoringOtherApps:YES];
        
    } else {
        NSLog(@"Unexpected message type: %@", type);
    }
    
    // Listen for the next message
    [self readMessage];
}

@end
