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
@synthesize enabled=_enabled;

- (id)initWithButton:(CBButton *)theButton
{
    self = [super initWithElement:theButton];
    if (self) {
        button = theButton;
        _enabled = NO;
    }
    return self;
}

- (void)loadView
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    v.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _buttonLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _buttonLabel.text = self.button.label;
    _buttonLabel.textAlignment = UITextAlignmentCenter;
    _buttonLabel.backgroundColor = [UIColor clearColor];
    _buttonLabel.textColor = labelColor;
    
    [v addSubview:_buttonLabel];
    self.view = v;
    
    // setEnabled handles the remaining styling
    [self setEnabled:NO];
}

- (void)viewDidLayoutSubviews
{
    // Fill the view, so text is centered
    _buttonLabel.frame = self.view.bounds;
}

- (bool)enabled
{
    return _enabled;
}

- (void)setEnabled:(bool)enabled
{
    _enabled = enabled;
    
    CGFloat fontSize = 24.0f;
    if (enabled) {
        self.view.backgroundColor= activeColor;
        _buttonLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        self.view.backgroundColor = inactiveColor;
        _buttonLabel.font = [UIFont systemFontOfSize:fontSize];
    }
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
