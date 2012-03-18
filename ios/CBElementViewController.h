//
//  CBElementViewController.h
//  CubicusClient
//
//  Created by James Potter on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBLayoutElement.h"
#import "CBEvent.h"
#import "CBEventReceiver.h"

@interface CBElementViewController : UIViewController <CBEventReceiver> {
    @private
    UILabel *_label;
    @public
    UIColor *activeColor;
    UIColor *inactiveColor;
    UIColor *labelColor;
}

- (id)initWithElement:(CBLayoutElement *)element;
- (void)fireEvent:(CBEvent *)event;

@property (nonatomic, strong, readonly) CBLayoutElement *element;
@property (nonatomic, weak) id<CBEventReceiver> eventReceiver;

@end