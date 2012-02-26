//
//  CBLayout.m
//  Cubicus
//
//  Created by James Potter on 12/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBLayout.h"

@implementation CBLayout

@synthesize rootElement;

- (id)initWithRoot:(CBLayoutElement *)theRootElement;
{
    self = [super init];
    if (self) {
        rootElement = theRootElement;
    }
    return self;
}

- (NSDictionary *)toJSON
{
    return [self.rootElement toJSON];
}

+ (CBLayout *)fromJSON:(NSDictionary *)json
{
    CBLayoutElement *root = [CBLayoutElement fromJSON:json];
    CBLayout *layout = [[CBLayout alloc] initWithRoot:root];
    
    NSLog(@"new layout with root = %@", root);
    
    return layout;
}

@end
