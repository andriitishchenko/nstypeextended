//
//  UIViewController+ViewControllerCategory.h
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (ViewControllerCategory)
- (void)containerRemoveChildViewController:(UIViewController *)childViewController ;
- (void)containerAddChildViewController:(UIViewController *)childViewController;
@end
