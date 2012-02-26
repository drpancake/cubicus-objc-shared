//
//  CBAppClient.m
//  Cubicus
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBAppClient.h"

@implementation CBAppClient

#pragma mark -
#pragma mark AsyncSocketDelegate

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    [super onSocket:sock didConnectToHost:host port:port];
    
    // Step 1: send 'application_identify' message
    [self sendMessage:@"application_identify" content:@"hello" tag:CBAppClientTagIdentify];
}

@end
