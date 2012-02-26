//
//  CBAppClient.m
//  Cubicus
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBAppClient.h"
#import "CubicusDraw.h"
#import "CBContext.h"
#import "CBLayout.h"

@implementation CBAppClient

- (id)initWithHost:(CBHost *)theHost
{
    self = [super initWithHost:theHost];
    if (self) {
        _managers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addContextManager:(CBContextManager *)manager
{
    [_managers addObject:manager];
    NSLog(@"New ctx manager: %@", manager);
}

#pragma mark -
#pragma mark AsyncSocketDelegate

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    [super onSocket:sock didConnectToHost:host port:port];
    
    // Step 1: send 'application_identify' message
    
//    CBLayout *canvasLayout = [[CBLayout alloc] initWithRoot:nil];
//    CBContext *canvasContext = [[CBContext alloc] initWithID:1 layout:canvasLayout];
//    NSMutableArray *contexts = [[NSMutableArray alloc] initWithCapacity:[_managers count]];
//    for (CBContextManager *manager in _managers) {
//        // TODO here
//        [contexts addObject:[manager.context toJSON]];
//    }
//    
//    NSDictionary *content = [NSDictionary dictionaryWithObjectsAndKeys:CD_APP_NAME, @"name", contexts, @"contexts", nil];
//    [self sendMessage:@"application_identify" content:content tag:CBAppClientTagIdentify];
}

@end
