//
//  CBButtonViewController.h
//  Cubicus
//
//  Created by James Potter on 14/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CBElementViewController.h"
#import "CBButton.h"

@interface CBButtonViewController : CBElementViewController {
    @private
    bool _enabled;
    UILabel *_buttonLabel;
}

- (id)initWithButton:(CBButton *)button;

@property (nonatomic, strong, readonly) CBButton *button;
@property (nonatomic, assign) bool enabled;

@end