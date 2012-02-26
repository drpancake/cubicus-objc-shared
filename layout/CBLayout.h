//
//  CBLayout.h
//  Cubicus
//
//  Created by James Potter on 12/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBLayoutElement.h"

@interface CBLayout : NSObject

- (id)initWithRoot:(CBLayoutElement *)rootElement;
- (NSDictionary *)toJSON;
+ (CBLayout *)fromJSON:(NSDictionary *)json;

@property (nonatomic, strong, readonly) CBLayoutElement *rootElement;

@end
