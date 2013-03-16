#ModalPresentationTransform

**ModalPresentationTransform** is a category on `UIViewController` that adds GMail or Sunrise style 3D or Affine transforms while presenting and dismissing view controllers modally.

##How to use it

At some point in your application, set a transform to be used while presenting and dismissing view controllers by calling `+ (void)setTransformForModalPresentation:` or `+ (void)setAffineTransformForModalPresentation:`.  Then, just present and dismiss modal view controllers normally.

##How it works

When you set the transform, **ModalPresentationTransform** swizzles the default implementations of `presentViewController:animated:completion:` and `dismissViewControllerAnimated:completion:.  Then, when you call either of those methods, it animates the transform on the window's rootViewController's view before calling the original implementation.

###Isn't swizzling dangerous?

It's so dangerous, it's *dangeresque*.

###Was that a Strong Bad reference?

Yes!

###What is this, 2002?

Shut up!

##TODO

Things may get weird if you're presenting more than one modal at once, since the transform is only being applied to the window's rootViewController.