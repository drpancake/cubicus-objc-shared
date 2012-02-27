//
//  CBAbstractClient.m
//  CubicusDraw
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBAbstractClient.h"

@implementation CBAbstractClient

@synthesize host;
@synthesize socket;
@synthesize writer;
@synthesize parser;

- (id)initWithHost:(CBHost *)theHost
{
    self = [super init];
    if (self) {
        host = theHost;
        socket = [[AsyncSocket alloc] initWithDelegate:self];
        writer = [[SBJsonWriter alloc] init];
        parser = [[SBJsonParser alloc] init];
    }
    return self;
}

- (void)connect
{
    NSLog(@"Connecting...");    
    NSError *err;
    if (![self.socket connectToHost:self.host.address
                        onPort:[self.host.port intValue]
                              error:&err]) {
        NSLog(@"Connect failed with error: %@", err);
    }

}

#pragma mark -
#pragma mark Helper methods

- (void)sendMessage:(NSString *)type content:(id)obj
{
    [self sendMessage:type content:obj tag:CBAbstractClientTagMessage];
}

- (void)sendMessage:(NSString *)type content:(id)obj tag:(long)tag
{
    NSLog(@"sendMessage: %@", type);
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          type, @"type", obj, @"content", nil];
    NSString *msg = [NSString stringWithFormat:@"%@\r\n", [self.writer stringWithObject:dict]];
    
    // TODO: tag?
    [self.socket writeData:[msg dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:tag];
}

- (void)readMessage
{
    // Read up to CRLF delimiter i.e. end of message
    [self.socket readDataToData:[AsyncSocket CRLFData] withTimeout:-1 tag:CBAbstractClientTagMessage];
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
}

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{

}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSAssert(tag == CBAbstractClientTagMessage, @"Expecting a message");
}

@end
