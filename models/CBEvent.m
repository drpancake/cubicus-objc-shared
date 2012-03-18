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

+ (CBEvent *)fromJSON:(NSDictionary *)json
{
    NSUInteger eid = [(NSNumber *)[json objectForKey:@"element_id"] unsignedIntValue];
    NSDictionary *content = (NSDictionary *)[json objectForKey:@"content"];
    CBEvent *event = [[CBEvent alloc] initWithID:eid content:content];
    event.contextID = [(NSNumber *)[json objectForKey:@"context_id"] unsignedIntValue];
    return event;
}

#pragma mark -
#pragma mark CBSerializable

- (NSDictionary *)toJSON
{
    NSDictionary *json = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:self.applicationID], @"application_id",
                          [NSNumber numberWithInt:self.contextID], @"context_id",
                          [NSNumber numberWithInt:self.elementID], @"element_id",
                          self.content, @"content", nil];
    return json;
}

@end
