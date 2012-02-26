//
//  CBContext.h
//  Cubicus
//
//  Created by James Potter on 06/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBLayout.h"

@interface CBContext : NSObject

- (id)initWithID:(NSUInteger)contextID layout:(CBLayout *)layout;
- (NSDictionary *)toJSON;
+ (CBContext *)fromJSON:(NSDictionary *)json;

@property (nonatomic, readonly) NSUInteger contextID;
@property (nonatomic, strong, readonly) CBLayout *layout;

@end
