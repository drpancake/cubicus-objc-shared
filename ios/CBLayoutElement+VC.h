//
//  CBLayoutElement+VC.h
//  Cubicus
//
//  Created by James Potter on 04/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBShared.h"

/*
  Adds iOS-specific viewController: method
*/

@interface CBLayoutElement (CBLayoutElement_VC)

- (UIViewController *)viewControllerForElement;

@end
