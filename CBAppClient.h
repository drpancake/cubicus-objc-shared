//
//  CBAppClient.h
//  Cubicus
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBAbstractClient.h"

/*
 Used to identify async callbacks for reads/writes
 */
enum {
    CBAppClientTagIdentify
} CBAppClientTag;

@interface CBAppClient : CBAbstractClient

@end
