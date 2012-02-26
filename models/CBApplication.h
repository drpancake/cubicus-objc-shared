//
//  CBApplication.h
//  Cubicus
//
//  Created by James Potter on 12/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBApplication : NSObject

- (id)initWithID:(NSUInteger)applicationID contexts:(NSArray *)contexts;
+ (CBApplication *)fromJSON:(NSDictionary *)json;

@property (nonatomic, readonly) NSUInteger applicationID;
@property (nonatomic, strong, readonly) NSArray *contexts;

@end
