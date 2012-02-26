//
//  CBDeviceClient.h
//  Cubicus
//
//  Created by James Potter on 10/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"
#import "SBJson.h"

#import "CBDeviceClientDelegate.h"
#import "CBHost.h"

//enum {
//    CBDeviceClientStateConnected,
//} CBDeviceClientState;

/*
  Used to identify async callbacks for reads/writes
*/
enum {
    CBDeviceClientTagIdentify,
    CBDeviceClientTagMessage
} CBDeviceClientTag;

@interface CBDeviceClient : NSObject<AsyncSocketDelegate> {
    SBJsonWriter *_writer;
    SBJsonParser *_parser;
}

- (id)initWithHost:(CBHost *)host guid:(NSString *)guid;
- (void)connect;

// Helpers
- (void)sendMessage:(NSString *)type content:(id)obj tag:(long)tag;
- (void)readMessage; // non-blocking; actual data arrives in callback
+ (NSString *)generateGUID;

- (void)switchApplication:(NSUInteger)applicationID context:(NSUInteger)contextID;

@property (nonatomic, strong, readonly) CBHost *host;
@property (nonatomic, strong, readonly) NSString *guid;
@property (nonatomic, weak) id<CBDeviceClientDelegate> delegate;
@property (nonatomic, strong, readonly) AsyncSocket *socket;

@end
