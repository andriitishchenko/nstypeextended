//
//  UIViewController+ViewControllerCategory.m
//

#import "UIViewController+ViewControllerCategory.h"

@implementation UIViewController (ViewControllerCategory)
- (void)containerRemoveChildViewController:(UIViewController *)childViewController {
    [childViewController willMoveToParentViewController:nil];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}
- (void)containerAddChildViewController:(UIViewController *)childViewController {
    [self addChildViewController:childViewController];
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
}
@end
