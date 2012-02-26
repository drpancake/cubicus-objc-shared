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
    }
    
    return obj;
}

@end
