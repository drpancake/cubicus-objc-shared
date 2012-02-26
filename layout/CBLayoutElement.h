//
//  CBLayoutElement.h
//  Cubicus
//
//  Created by James Potter on 12/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef double CBRatio;

/*
  CBLayoutElement is a class cluster with common properties
  elementID and ratio.
*/
@interface CBLayoutElement : NSObject

/*
  Subclasses should override this and be sure to call super's implementation.
  Not to be called directly
*/
- (id)initWithJSON:(NSDictionary *)json;

/*
  Class cluster initializer - instantiates the correct
  CBLayoutElement subclass based on the 'type' key supplied
*/
+ (CBLayoutElement *)fromJSON:(NSDictionary *)json;

/*
  Subclasses should override this to provide their own view.
  Default is a label with the model class name as its value
*/
- (UIView *)viewWithFrame:(CGRect)frame;

@property (nonatomic, readonly) NSUInteger elementID;
@property (nonatomic, readonly) CBRatio ratio;

@end
