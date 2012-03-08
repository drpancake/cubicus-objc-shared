//
//  CBElementViewController.m
//  CubicusClient
//
//  Created by James Potter on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBElementViewController.h"

UIColor *makeColor(void) {
    CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

@implementation CBElementViewController

- (void)loadView
{
    // Default stub
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    v.backgroundColor = makeColor();
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.text = [NSString stringWithFormat:@"<%@>", [self class]];
    _label.backgroundColor = [UIColor clearColor];
    [v addSubview:_label];
    self.view = v;
}

- (void)viewDidLayoutSubviews
{
    _label.frame = self.view.bounds;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
