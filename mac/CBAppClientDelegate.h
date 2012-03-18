//
//  CBAppClientDelegate.h
//  Cubicus
//
//  Created by James Potter on 26/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
  NOTE:
  Context switches are broadcast by KVO rather than using this delegate,
  as there are many observers
*/

@class CBAppClient;
@class CBEvent;

@protocol CBAppClientDelegate <NSObject>

- (void)client:(CBAppClient *)client didReceiveEvent:(CBEvent *)event;

@end
