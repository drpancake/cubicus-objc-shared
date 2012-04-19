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
    self = [super initWithElement:theButton];
    if (self) {
        button = theButton;
        
        NSLog(@"b = %@, sel = %i", self.button, self.button.selected);
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
    
    [self syncWithElement];
}

- (void)viewDidLayoutSubviews
{
    // Fill the view, so text is centered
    _buttonLabel.frame = self.view.bounds;
}

- (void)syncWithElement
{
    CGFloat fontSize = 24.0f;
    if (self.button.selected) {
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
