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
    UILabel *_buttonLabel;
}

- (id)initWithButton:(CBButton *)button;
- (void)handleTap:(UITapGestureRecognizer *)sender;

// Alter style to math attached CBButton
- (void)syncWithElement;

@property (nonatomic, strong, readonly) CBButton *button;

@end