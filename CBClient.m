//
//  CBClient.m
//  Cubicus
//
//  Created by James Potter on 10/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBClient.h"
#import "CBApplication.h"
#import "Cubicus.h"

#import "CBContext.h" // delete

@implementation CBClient

@synthesize delegate;
@synthesize host;
@synthesize socket;

- (id)initWithHost:(CBHost *)theHost
{
    self = [super init];
    if (self) {
        host = theHost;
        socket = [[AsyncSocket alloc] initWithDelegate:self];
        _writer = [[SBJsonWriter alloc] init];
        _parser = [[SBJsonParser alloc] init];
    }
    return self;
}

- (void)connect
{
    // NSError = ...
    NSLog(@"Connecting...");
    [self.socket connectToHost:self.host.address onPort:[self.host.port intValue] error:nil];
    
//    // Dummy applications
//    CBApplication *a1 = [[CBApplication alloc] init];
//    CBApplication *a2 = [[CBApplication alloc] init];
//    [self.delegate client:self didReceiveApplications:[NSArray arrayWithObjects:a1, a2, nil]];
//    
//    // Dummy switch
//    [self.delegate client:self didSwitchApplication:1 context:1];
}

#pragma mark -
#pragma mark Helper methods

- (void)sendMessage:(NSString *)type content:(id)obj tag:(long)tag
{
    NSLog(@"sendMessage: %@", type);
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          type, @"type", obj, @"content", nil];
    NSString *msg = [NSString stringWithFormat:@"%@\r\n", [_writer stringWithObject:dict]];
    
    // TODO: tag?
    [self.socket writeData:[msg dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:tag];
}

- (void)readMessage
{
    // Read up to CRLF delimiter i.e. end of message
    [self.socket readDataToData:[AsyncSocket CRLFData] withTimeout:-1 tag:CBClientTagMessage];
}

- (NSString *)getGUID
{
    // Get stored GUID or create one (and persist it)
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *uuidString = [def objectForKey:CB_GUID_KEY];
    if (!uuidString) {
        CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
        
        // __bridge_transfer means ARC takes care of release
        uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
        
        CFRelease(uuid);
        [def setObject:uuidString forKey:CB_GUID_KEY];
    }
    return uuidString;
}

#pragma mark -

- (void)switchApplication:(NSUInteger)applicationID context:(NSUInteger)contextID
{
    // TODO: message to server
    
    [self.delegate client:self didSwitchApplication:applicationID context:contextID];
}

#pragma mark -
#pragma mark AsyncSocketDelegate

- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    NSLog(@"onSocketDidDisconnect called (failed to connect?)");
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"didConnect!");

    // Step 1: send 'device_identify' message
    [self sendMessage:@"device_identify" content:[self getGUID] tag:CBClientTagIdentify];
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    switch (tag) {
        case CBClientTagIdentify:
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
    NSAssert(tag == CBClientTagMessage, @"Expecting a message");
    
//    NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *msg = (NSDictionary *)[_parser objectWithData:data]; // assumes UTF-8
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
        
    } else {
        NSLog(@"Unexpected message type: %@", type);
    }
    
    // Listen for the next message
    [self readMessage];
}

@end
