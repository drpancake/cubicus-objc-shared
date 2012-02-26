//
//  CBClient.h
//  Cubicus
//
//  Created by James Potter on 10/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "SBJson.h"

#import "CBClientDelegate.h"
#import "CBHost.h"

//enum {
//    CBClientStateConnected,
//} CBClientState;

/*
  Used to identify async callbacks for reads/writes
*/
enum {
    CBClientTagIdentify,
    CBClientTagMessage
} CBClientTag;

@interface CBClient : NSObject<AsyncSocketDelegate> {
    SBJsonWriter *_writer;
    SBJsonParser *_parser;
}

- (id)initWithHost:(CBHost *)host;
- (void)connect;

// Helpers
- (void)sendMessage:(NSString *)type content:(id)obj tag:(long)tag;
- (void)readMessage; // non-blocking; actual data arrives in callback
- (NSString *)getGUID;

- (void)switchApplication:(NSUInteger)applicationID context:(NSUInteger)contextID;

@property (nonatomic, strong, readonly) CBHost *host;
@property (nonatomic, weak) id<CBClientDelegate> delegate;
@property (nonatomic, strong, readonly) AsyncSocket *socket;

@end