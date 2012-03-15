//
//  CBElementViewControllerDelegate.h
//  CubicusClient
//
//  Created by James Potter on 14/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBElementViewController;
@class CBEvent;

@protocol CBElementViewControllerDelegate <NSObject>

- (void)elementViewController:(CBElementViewController *)viewController didSendEvent:(CBEvent *)event;

@end
