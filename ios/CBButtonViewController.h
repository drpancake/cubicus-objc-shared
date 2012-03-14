//
//  CBButtonViewController.h
//  Cubicus
//
//  Created by James Potter on 14/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CBElementViewController.h"
#import "CBButton.h"

@interface CBButtonViewController : CBElementViewController

- (id)initWithButton:(CBButton *)button;

@property (nonatomic, strong, readonly) CBButton *button;

@end