//
//  CBButton.h
//  Cubicus
//
//  Created by James Potter on 19/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CBLayoutElement.h"

@interface CBButton : CBLayoutElement

@property (nonatomic, strong, readwrite) NSString *label;
@property (nonatomic, readwrite) BOOL selected;

// Button group - all buttons with the same group number
// (in the same context) act as radio buttons
@property (nonatomic, readwrite) NSUInteger group;

@end
