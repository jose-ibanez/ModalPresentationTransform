//
//  UIViewController+ModalPresentationTransform.m
//  ModalPresentationTransform
//
//  Created by Jose Ibanez on 3/16/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#import "UIViewController+ModalPresentationTransform.h"
#import <objc/runtime.h>

#define kAnimationDuration (1.0 / 3.0)

void Swizz(Class c, SEL orig, SEL replace)
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, replace);
    if(class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, replace, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}

@implementation UIViewController (ModalPresentationTransform)

static CATransform3D _transform = (CATransform3D){1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1};
static dispatch_once_t _swizzleToken;


+ (void)setTransformForModalPresentation:(CATransform3D)transform {
    dispatch_once(&_swizzleToken, ^{
        Swizz(self, @selector(presentViewController:animated:completion:), @selector(customPresentViewController:animated:completion:));
        Swizz(self, @selector(dismissViewControllerAnimated:completion:), @selector(customDismissViewControllerAnimated:completion:));
    });
    _transform = transform;
}

+ (CATransform3D)transformForModalPresentation {
    return _transform;
}

+ (void)setAffineTransformForModalPresentation:(CGAffineTransform)affineTransform {
    [self setTransformForModalPresentation:CATransform3DMakeAffineTransform(affineTransform)];
}

- (void)customPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    [UIView animateWithDuration:flag ? kAnimationDuration : 0.0
                     animations:^{
                         [UIApplication sharedApplication].keyWindow.rootViewController.view.layer.transform = _transform;
                     }];
    
    [self customPresentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)customDismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [UIView animateWithDuration:flag ? kAnimationDuration : 0.0
                     animations:^{
                         [UIApplication sharedApplication].keyWindow.rootViewController.view.layer.transform = CATransform3DIdentity;
                     }];
    
    [self customDismissViewControllerAnimated:flag completion:completion];
}

@end
