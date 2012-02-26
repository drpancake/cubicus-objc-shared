//
//  CBAbstractClient.h
//  CubicusDraw
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "SBJson.h"

#import "CBHost.h"

/*
 Used to identify async callbacks for reads/writes
 */
enum {
    CBAbstractClientTagMessage
} CBAbstractClientTag;

@interface CBAbstractClient : NSObject<AsyncSocketDelegate>

- (id)initWithHost:(CBHost *)theHost;
- (void)connect;

// Helpers
- (void)sendMessage:(NSString *)type content:(id)obj tag:(long)tag;
- (void)readMessage; // non-blocking; actual data arrives in callback

@property (nonatomic, strong, readonly) CBHost *host;
@property (nonatomic, strong, readonly) AsyncSocket *socket;
@property (nonatomic, strong, readonly) SBJsonWriter *writer;
@property (nonatomic, strong, readonly) SBJsonParser *parser;

@end
