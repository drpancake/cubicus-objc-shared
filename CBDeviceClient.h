//
//  CBDeviceClient.h
//  Cubicus
//
//  Created by James Potter on 10/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBAbstractClient.h"
#import "CBDeviceClientDelegate.h"
#import "CBEvent.h"

/*
 Used to identify async callbacks for reads/writes
 */
enum {
    CBDeviceClientTagIdentify
} CBDeviceClientTag;

@interface CBDeviceClient : CBAbstractClient

- (id)initWithHost:(CBHost *)host guid:(NSString *)guid;

// Helper methods
+ (NSString *)generateGUID;

// Messages
- (void)switchApplication:(NSUInteger)applicationID context:(NSUInteger)contextID;
- (void)sendEvent:(CBEvent *)event;
- (void)sendPairResponse:(NSString *)pin;

@property (nonatomic, strong, readonly) NSString *guid;
@property (nonatomic, weak) id<CBDeviceClientDelegate> delegate;

@end
