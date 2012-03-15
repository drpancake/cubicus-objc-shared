//
//  CBElementViewController.h
//  CubicusClient
//
//  Created by James Potter on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBElementViewControllerDelegate.h"
#import "CBEvent.h"

@interface CBElementViewController : UIViewController <CBElementViewControllerDelegate> {
    @private
    UILabel *_label;
    @public
    UIColor *activeColor;
    UIColor *inactiveColor;
    UIColor *labelColor;
}

- (void)sendEvent:(CBEvent *)event;

@property (nonatomic, weak) id<CBElementViewControllerDelegate> delegate;

@end