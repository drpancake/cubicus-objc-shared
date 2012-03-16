//
//  CBContext.m
//  Cubicus
//
//  Created by James Potter on 06/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBContext.h"

@implementation CBContext

@synthesize contextID;
@synthesize layout;

- (id)initWithID:(NSUInteger)theContextID layout:(CBLayout *)theLayout
{
    self = [super init];
    if (self) {
        contextID = theContextID;
        layout = theLayout;
    }
    return self;
}

+ (CBContext *)fromJSON:(NSDictionary *)json
{
    CBLayout *layout = [CBLayout fromJSON:[json objectForKey:@"layout"]];
    CBContext *context = [[CBContext alloc] initWithID:[[json objectForKey:@"id"] intValue]
                                                layout:layout];
    return context;
}

#pragma mark -
#pragma mark CBSerializable

- (NSDictionary *)toJSON
{
    // id, layout, default=?
    NSDictionary *json = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:self.contextID], @"id",
                          [self.layout toJSON], @"layout", nil];
    return json;
}

@end
