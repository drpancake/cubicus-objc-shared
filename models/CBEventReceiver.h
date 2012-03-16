//
//  CBEventReceiver.h
//  CubicusClient
//
//  Created by James Potter on 16/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBEvent;

@protocol CBEventReceiver <NSObject>

- (void)sender:(id)sender didFireEvent:(CBEvent *)event;

@end
