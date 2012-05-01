//
//  CBAppClient.h
//  Cubicus
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBAbstractClient.h"
#import "CBContextManager.h"
#import "CBEvent.h"

/*
 Used to identify async callbacks for reads/writes
 */
enum {
    CBAppClientTagIdentify
} CBAppClientTag;

@interface CBAppClient : CBAbstractClient {
    NSMutableArray *_managers;
    NSUInteger _defaultContextID;
}

- (id)initWithHost:(CBHost *)host applicationName:(NSString *)applicationName;

// All added context managers will be sent CBEvent objects
- (void)addContextManager:(CBContextManager *)manager;
- (void)addContextManager:(CBContextManager *)manager defaultContext:(BOOL)isDefault;

// Messages
- (void)switchContext:(NSUInteger)contextID;
- (void)sendEvent:(CBEvent *)event;
- (void)sendBecameActive;

@property (nonatomic, strong, readonly) NSString *applicationName;

// Note: KVO observed by CBContextManager objects
@property (nonatomic, strong, readwrite) NSNumber *currentContextID;

@end
