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
    
    if (isDefault == YES) {
        _defaultContextID = manager.context.contextID;
        self.currentContextID = [NSNumber numberWithInt:_defaultContextID];
    }
}

- (void)switchContext:(NSUInteger)contextID
{
    self.currentContextID = [NSNumber numberWithInt:contextID];
    [self sendMessage:@"switch_context" content:self.currentContextID tag:0];
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

@end
