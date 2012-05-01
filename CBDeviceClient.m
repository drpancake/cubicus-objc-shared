//
//  CBDeviceClient.m
//  Cubicus
//
//  Created by James Potter on 10/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBDeviceClient.h"
#import "CBApplication.h"

@implementation CBDeviceClient

@synthesize delegate;
@synthesize guid;

- (id)initWithHost:(CBHost *)theHost guid:(NSString *)theGuid
{
    self = [super initWithHost:theHost];
    if (self) {
        guid = theGuid;
    }
    return self;
}


#pragma mark -
#pragma mark Helper methods

+ (NSString *)generateGUID
{
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    // __bridge_transfer means ARC takes care of release
    NSString * uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    CFRelease(uuid);
    return uuidString;
}

#pragma mark -
#pragma mark Messages

- (void)switchApplication:(NSUInteger)applicationID context:(NSUInteger)contextID
{
    NSDictionary *state = [NSDictionary dictionaryWithObjectsAndKeys:
                           [NSNumber numberWithInt:applicationID], @"current_application",
                           [NSNumber numberWithInt:contextID], @"current_context", nil];
    [self sendMessage:@"state" content:state tag:0];
    
    [self.delegate client:self didSwitchApplication:applicationID context:contextID];
}

- (void)sendEvent:(CBEvent *)event
{
    NSLog(@"sending event; %@", event);
    [self sendMessage:@"event" content:[event toJSON]];
}

- (void)sendPairResponse:(NSString *)pin
{
    [self sendMessage:@"pair_response" content:pin];
}

#pragma mark -
#pragma mark AsyncSocketDelegate

//- (void)onSocketDidDisconnect:(AsyncSocket *)sock
//{
//    NSLog(@"onSocketDidDisconnect called (failed to connect?)");
//}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    [super onSocket:sock didConnectToHost:host port:port];
    
    // Step 1: send 'device_identify' message
    [self sendMessage:@"device_identify" content:self.guid tag:CBDeviceClientTagIdentify];
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    [super onSocket:sock didWriteDataWithTag:tag];
    
    switch (tag) {
        case CBDeviceClientTagIdentify:
            // Step 2. wait for 'applications' message
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
    
    if ([type isEqualToString:@"applications"]) {
        // Convert to CBApplication's
        NSArray *jsonArray = (NSArray *)content;
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:[jsonArray count]];
        for (NSDictionary *dict in jsonArray) {
            [arr addObject:[CBApplication fromJSON:dict]];
        }
        
        // Send to delegate
        NSArray *applications = [[NSArray alloc] initWithArray:arr];
        [self.delegate client:self didReceiveApplications:applications];
        
    } else if ([type isEqualToString:@"state"]) {
        // Send to delegate
        NSDictionary *state = (NSDictionary *)content;
        NSUInteger appID = [[state objectForKey:@"current_application"] intValue];
        NSUInteger contextID = [[state objectForKey:@"current_context"] intValue];
        [self.delegate client:self didSwitchApplication:appID context:contextID];
        
    } else if ([type isEqualToString:@"event"]) {
        // Deserialize and send to delegate
        CBEvent *event = [CBEvent fromJSON:(NSDictionary *)content];
        [self.delegate client:self didReceiveEvent:event];
    } else if ([type isEqualToString:@"pair_request"]) {
        [self.delegate clientDidReceivePairRequest:self];
    } else {
        NSLog(@"Unexpected message type: %@", type);
    }
    
    // Listen for the next message
    [self readMessage];
}

@end
