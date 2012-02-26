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

- (id)initWithJSON:(NSDictionary *)json
{
    self = [super initWithJSON:json];
    if (self) {
        label = [json objectForKey:@"label"];
    }
    return self;
}

- (UIView *)viewWithFrame:(CGRect)frame
{
    UIView *v = [[UIView alloc] initWithFrame:frame];
    
    UILabel *labelView = [[UILabel alloc] initWithFrame:v.bounds];
    labelView.text = self.label;
//    labelView.center = v.center;
    [v addSubview:labelView];
    
    return v;
}

@end
