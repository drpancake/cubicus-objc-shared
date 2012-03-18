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
    self = [super initWithElement:theBox];
    if (self) {
        box = theBox;
        _addedElements = NO;
        _elementViewControllers = [[NSMutableArray alloc] init];
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
            [_elementViewControllers addObject:vc];
            
            // For bubbling up child events
            vc.eventReceiver = self;
            
            [self addChildViewController:vc];
            [self.view addSubview:vc.view];
            vc.view.frame = f;
            vc.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        }
        
        _addedElements = YES;
    }
}

#pragma mark -
#pragma mark CBEventReceiver

- (void)sender:(id)sender didFireEvent:(CBEvent *)event
{
    if ([sender isKindOfClass:[CBElementViewController class]]) {
        // Event came from a child element so forward it upwards
        [self fireEvent:event];
    } else {
        // Otherwise forward to the element it's intended for
        for (CBElementViewController *vc in _elementViewControllers) {
            if (vc.element.elementID == event.elementID) {
                [vc sender:self didFireEvent:event];
                break;
            }
        }
    }
}

@end
