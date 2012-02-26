//
//  CBApplication.m
//  Cubicus
//
//  Created by James Potter on 12/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBApplication.h"
#import "CBContext.h"

@implementation CBApplication

@synthesize applicationID;
@synthesize contexts;

- (id)initWithID:(NSUInteger)theApplicationID contexts:(NSArray *)theContexts
{
    self = [super init];
    if (self) {
        applicationID = theApplicationID;
        contexts = theContexts;
    }
    return self;
}

+ (CBApplication *)fromJSON:(NSDictionary *)json
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in [json objectForKey:@"contexts"]) {
        CBContext *context = [CBContext fromJSON:dict];
        [arr addObject:context];
    }
    
    NSArray *contexts = [NSArray arrayWithArray:arr];
    CBApplication *app = [[CBApplication alloc] initWithID:[[json objectForKey:@"id"] intValue]
                                                  contexts:contexts];
    return app;
}

@end
