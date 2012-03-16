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
@synthesize applicationID;
@synthesize contextID;

- (id)initWithID:(NSUInteger)theElementID content:(NSDictionary *)theContent
{
    self = [super init];
    if (self) {
        elementID = theElementID;
        content = theContent;
        applicationID = -1;
        contextID = -1;
    }
    return self;
}

#pragma mark -
#pragma mark CBSerializable

- (NSDictionary *)toJSON
{
//    // id, layout, default=?
//    NSDictionary *json = [[NSDictionary alloc] initWithObjectsAndKeys:
//                          [NSNumber numberWithInt:self.contextID], @"id",
//                          [self.layout toJSON], @"layout", nil];
//    return json;
    return nil;
}

@end
