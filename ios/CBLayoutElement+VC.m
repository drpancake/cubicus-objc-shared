//
//  CBLayoutElement+VC.m
//  Cubicus
//
//  Created by James Potter on 04/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBLayoutElement+VC.h"

@implementation CBLayoutElement (CBLayoutElement_VC)

- (CBElementViewController *)viewControllerForElement
{
    CBElementViewController *vc;
    if ([self isKindOfClass:[CBBox class]]) {
        vc = [[CBBoxViewController alloc] initWithBox:(CBBox *)self];
    } else if ([self isKindOfClass:[CBCanvas class]]) {
        vc = [[CBCanvasViewController alloc] init];
    } else {
        // Default stub
        vc = [[CBElementViewController alloc] init];
    }
    
    return vc;
}

@end
