//
//  CBBoxViewController.m
//  CubicusClient
//
//  Created by James Potter on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBBoxViewController.h"

@implementation CBBoxViewController

@synthesize box;

- (id)initWithBox:(CBBox *)theBox
{
    self = [super init];
    if (self) {
        box = theBox;
        _addedElements = NO;
    }
    return self;
}

- (void)loadView
{
    UIView *container = [[UIView alloc] initWithFrame:CGRectZero];
    container.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.view = container;
}

- (void)viewDidLayoutSubviews
{
    if (!_addedElements) {
        CGRect frame = self.view.bounds; // frame?
        CGFloat x = frame.origin.x;
        CGFloat y = frame.origin.y;
        CGFloat h = frame.size.height;
        CGFloat w;

        for (CBLayoutElement *el in self.box.items) {
            // Assuming hbox for now
            
            w = frame.size.width * el.ratio;
            CGRect f = CGRectMake(x, y, w, h);
            x += w;
            
            // Each child element produces a VC, used as a child of this VC
            CBElementViewController *vc = [el viewControllerForElement];
            
            // For bubbling up child events
            vc.delegate = self;
            
            [self addChildViewController:vc];
            [self.view addSubview:vc.view];
            vc.view.frame = f;
            vc.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        }
        
        _addedElements = YES;
    }
}

@end
