//
//  CBBoxViewController.h
//  CubicusClient
//
//  Created by James Potter on 07/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBShared.h"

@interface CBBoxViewController : CBElementViewController {
    @private
    BOOL _addedElements;
    NSMutableArray *_elementViewControllers;
}

- (id)initWithBox:(CBBox *)box;

@property (nonatomic, strong, readonly) CBBox *box;

@end
