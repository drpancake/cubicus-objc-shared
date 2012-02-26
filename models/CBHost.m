//
//  CBHost.m
//  Cubicus
//
//  Created by James Potter on 11/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBHost.h"

@implementation CBHost

@synthesize address;
@synthesize port;

- (id)initWithAddress:(NSString *)theAddress port:(NSNumber *)thePort
{
    self = [super init];
    if (self) {
        // Copies
        address = [NSString stringWithString:theAddress];
        port = [NSNumber numberWithInt:[thePort intValue]];
    }
    return self;
}

@end
