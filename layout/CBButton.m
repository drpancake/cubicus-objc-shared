//
//  CBButton.m
//  Cubicus
//
//  Created by James Potter on 19/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBButton.h"

@implementation CBButton

@synthesize label;
@synthesize selected;
@synthesize group;

- (id)initWithJSON:(NSDictionary *)json
{
    self = [super initWithJSON:json];
    if (self) {
        label = [json objectForKey:@"label"];
        
        if ([json objectForKey:@"selected"])
            selected = YES;
        
        NSNumber *groupNumber = [json objectForKey:@"group"];
        if (groupNumber == nil) {
            group = -1;
        } else {
            group = [groupNumber intValue];
        }
    }
    return self;
}

- (NSDictionary *)toJSON
{
    NSDictionary *base = [super toJSON];
    NSMutableDictionary *json = [[NSMutableDictionary alloc] initWithDictionary:base];
    [json setObject:self.label forKey:@"label"];
    [json setObject:[NSNumber numberWithBool:self.selected] forKey:@"selected"];
    
    if (self.group != -1)
        [json setObject:[NSNumber numberWithInt:self.group] forKey:@"group"];
    
    // Copy to immutable
    return [NSDictionary dictionaryWithDictionary:json];
}

@end
