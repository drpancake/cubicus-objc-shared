//
//  CBHost.h
//  Cubicus
//
//  Created by James Potter on 11/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBHost : NSObject

- (id)initWithAddress:(NSString *)address port:(NSNumber *)port;

@property (nonatomic, strong, readonly) NSString *address;
@property (nonatomic, strong, readonly) NSNumber *port;

@end
