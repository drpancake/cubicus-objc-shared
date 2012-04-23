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
        vc = [[CBCanvasViewController alloc] initWithCanvas:(CBCanvas *)self];
    } else if ([self isKindOfClass:[CBButton class]]) {
        vc = [[CBButtonViewController alloc] initWithButton:(CBButton *)self];
    } else if ([self isKindOfClass:[CBAccelerator class]]) {
        vc = [[CBAcceleratorViewController alloc] initWithAccelerator:(CBAccelerator *)self];
    } else {
        // Default stub
        vc = [[CBElementViewController alloc] initWithElement:self];
    }
    
    return vc;
}

@end
