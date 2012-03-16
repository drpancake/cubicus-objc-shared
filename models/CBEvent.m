//
//  CBEvent.m
//  CubicusClient
//
//  Created by James Potter on 14/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBEvent.h"

@implementation CBEvent

@synthesize content;
@synthesize elementID;

- (id)initWithID:(NSUInteger)theElementID content:(NSDictionary *)theContent
{
    self = [super init];
    if (self) {
        elementID = theElementID;
        content = theContent;
    }
    return self;
}

@end
