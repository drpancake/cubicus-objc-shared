//
//  CBButtonViewController.m
//  Cubicus
//
//  Created by James Potter on 14/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBButtonViewController.h"

@implementation CBButtonViewController

@synthesize button;

- (id)initWithButton:(CBButton *)theButton
{
    self = [super init];
    if (self) {
        button = theButton;
    }
    return self;
}

- (void)loadView
{
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = [UIColor greenColor];
    
    self.view = v;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
