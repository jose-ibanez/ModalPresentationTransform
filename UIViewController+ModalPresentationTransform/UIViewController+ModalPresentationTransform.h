//
//  UIViewController+ModalPresentationTransform.h
//  ModalPresentationTransform
//
//  Created by Jose Ibanez on 3/16/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIViewController (ModalPresentationTransform)

+ (void)setTransformForModalPresentation:(CATransform3D)transform;
+ (CATransform3D)transformForModalPresentation;

+ (void)setAffineTransformForModalPresentation:(CGAffineTransform)affineTransform;

@end
