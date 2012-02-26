//
//  CBBox.m
//  Cubicus
//
//  Created by James Potter on 19/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBBox.h"

@implementation CBBox

@synthesize items;

- (id)initWithJSON:(NSDictionary *)json
{
    self = [super initWithJSON:json];
    if (self) {
        NSArray *jsonItems = [json objectForKey:@"items"];
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:[jsonItems count]];
        
        for (NSDictionary *dict in jsonItems) {
            [arr addObject:[CBLayoutElement fromJSON:dict]];
        }
        
        items = [[NSArray alloc] initWithArray:arr];
    }
    return self;
}

@end
