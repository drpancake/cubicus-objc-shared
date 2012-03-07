//
//  CBLayoutElement+VC.m
//  Cubicus
//
//  Created by James Potter on 04/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBLayoutElement+VC.h"

@implementation CBLayoutElement (CBLayoutElement_VC)

- (UIViewController *)viewControllerForElement
{
    UIViewController *vc;
    if ([self isKindOfClass:[CBBox class]]) {
        vc = [[CBBoxViewController alloc] initWithBox:(CBBox *)self];
    }
//    if ([self isKindOfClass:[CBCanvas class]]) {
//        return nil;
//    } else {
//        vc = [[UIViewController alloc] init];
//        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
//    v.backgroundColor = [UIColor greenColor];
//        UILabel *labelView = [[UILabel alloc] initWithFrame:v.bounds];
//        labelView.text = [NSString stringWithFormat:@"<%@>", [self class]];
//        [v addSubview:labelView];
//        vc.view = v;
//    }
    
    return vc;
}

@end
