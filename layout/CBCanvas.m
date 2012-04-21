//
//  CBCanvas.m
//  Cubicus
//
//  Created by James Potter on 19/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBCanvas.h"

@implementation CBCanvas

@synthesize points;
@synthesize color;

- (id)initWithJSON:(NSDictionary *)json
{
    self = [super initWithJSON:json];
    if (self) {
        points = [json objectForKey:@"points"];
        color = [json objectForKey:@"color"];
    }
    return self;
}

- (NSDictionary *)toJSON
{
    NSDictionary *base = [super toJSON];
    NSMutableDictionary *json = [[NSMutableDictionary alloc] initWithDictionary:base];
    
    if (self.points)
        [json setObject:self.points forKey:@"points"];
    
    if (self.color)
        [json setObject:self.color forKey:@"color"];
    
    // Copy to immutable
    return [NSDictionary dictionaryWithDictionary:json];
}

@end
