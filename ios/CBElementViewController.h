//
//  CBElementViewController.h
//  CubicusClient
//
//  Created by James Potter on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBElementViewController : UIViewController {
    @private
    UILabel *_label;
    @public
    UIColor *activeColor;
    UIColor *inactiveColor;
    UIColor *labelColor;
}

@end