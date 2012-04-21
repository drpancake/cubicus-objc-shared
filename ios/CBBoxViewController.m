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

- (void)buttonSelected:(CBButtonViewController *)buttonViewController
{
    // If given button is in a group, deselect other buttons in that group
    if (buttonViewController.button.group != -1) {
        for (CBElementViewController *vc in _elementViewControllers) {
            if ([vc isKindOfClass:[CBButtonViewController class]]) {
                CBButtonViewController *c = (CBButtonViewController *)vc;
                if (c != buttonViewController && c.button.group == buttonViewController.button.group) {
                    ((CBButtonViewController *)vc).button.selected = NO;
                }
            }
        }
    }
}

#pragma mark -
#pragma mark CBEventReceiver

- (void)sender:(id)sender didFireEvent:(CBEvent *)event
{
    if ([sender isKindOfClass:[CBButtonViewController class]]) {
        // Events from child elements bubble upwards, but we need a special case
        // for button groups, as the other buttons in the group need to be deselected
        [self buttonSelected:sender];
        
        // Fire the event upwards as we would for a normal child element
        [self fireEvent:event];
        
    } else if ([sender isKindOfClass:[CBElementViewController class]]) {
        // Event came from a child element so forward it upwards
        [self fireEvent:event];
        
    } else {
        // Otherwise find the layout element this event is intended for
        CBElementViewController *recipient;
        for (CBElementViewController *vc in _elementViewControllers) {
            if (vc.element.elementID == event.elementID) {
                recipient = vc;
                break;
            }
        }
        
        // Special case for buttons in a button group: other child buttons
        // need to be deselected
        if ([recipient isKindOfClass:[CBButtonViewController class]]) {
            [self buttonSelected:(CBButtonViewController *)recipient];
        }
        
        // Forward event to the intended element regardless
        [recipient sender:self didFireEvent:event];
    }
}

@end
