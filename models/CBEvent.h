//
//  CBEvent.h
//  CubicusClient
//
//  Created by James Potter on 14/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBEvent : NSObject

- (id)initWithID:(NSUInteger)elementID content:(NSDictionary *)content;

@property (nonatomic, readonly) NSUInteger elementID;
@property (nonatomic, strong, readonly) NSDictionary *content;

@property (nonatomic, readwrite) NSUInteger applicationID;
@property (nonatomic, readwrite) NSUInteger contextID;

@end
