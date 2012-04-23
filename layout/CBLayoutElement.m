//
//  CBLayoutElement.m
//  Cubicus
//
//  Created by James Potter on 12/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBLayoutElement.h"

// Class cluster
#import "CBHorizontalBox.h"
#import "CBButton.h"
#import "CBCanvas.h"
#import "CBAccelerator.h"

@implementation CBLayoutElement

@synthesize elementID;
@synthesize ratio;

- (id)initWithJSON:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        elementID = [[json objectForKey:@"id"] intValue];
        ratio = [[json objectForKey:@"ratio"] doubleValue];
    }
    return self;
}

- (NSDictionary *)toJSON
{
    // TODO: could have an NSDict map from type to class name, use in toJSON and fromJSON
    
    NSString *type;
    if ([self isKindOfClass:[CBHorizontalBox class]]) {
        type = @"hbox";
    } else if ([self isKindOfClass:[CBButton class]]) {
        type = @"button";
    } else if ([self isKindOfClass:[CBCanvas class]]) {
        type = @"canvas";
    } else if ([self isKindOfClass:[CBAccelerator class]]) {
        type = @"accelerator";
    }
    
    NSDictionary *json = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [NSNumber numberWithInt:self.elementID], @"id",
                          type, @"type",
                          [NSNumber numberWithDouble:self.ratio], @"ratio", nil];
    return json;
}

+ (CBLayoutElement *)fromJSON:(NSDictionary *)json
{
    id obj = nil;
    
    NSString *type = [json objectForKey:@"type"];
    if ([type isEqualToString:@"hbox"]) {
        obj = [[CBHorizontalBox alloc] initWithJSON:json];
    } else if ([type isEqualToString:@"button"]) {
        obj = [[CBButton alloc] initWithJSON:json];
    } else if ([type isEqualToString:@"canvas"]) {
        obj = [[CBCanvas alloc] initWithJSON:json];
    } else if ([type isEqualToString:@"accelerator"]) {
        obj = [[CBAccelerator alloc] initWithJSON:json];
    }
    
    return obj;
}

@end
