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

@synthesize eventReceiver;

- (id)init
{
    self = [super init];
    if (self) {
        eventReceiver = nil;
        inactiveColor = [[UIColor alloc] initWithRed:0.960784 green:0.960784 blue:0.941176 alpha:1.0];
        activeColor = [[UIColor alloc] initWithRed:0.909804 green:0.909804 blue:0.858824 alpha:1.0];
        labelColor = [[UIColor alloc] initWithRed:0.843137 green:0.333333 blue:0.152941 alpha:1.0];
    }
    return self;
}

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

- (void)fireEvent:(CBEvent *)event
{
    if (self.eventReceiver) [self.eventReceiver sender:self didFireEvent:event];
}

#pragma mark -
#pragma mark CBEventReceiver

- (void)sender:(id)sender didFireEvent:(CBEvent *)event
{
    // Forward the event upwards
    [self fireEvent:event];
}

@end
