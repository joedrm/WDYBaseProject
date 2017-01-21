//
//  ModalPresentationViewController.h
//  MultiCustomUIComponent
//
//  Created by fang wang on 17/1/13.
//  Copyright © 2017年 wdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalPresentationViewController;

typedef enum : NSUInteger {
    ModalPresentationAnimationStyleFade,    // 渐现渐隐，默认
    ModalPresentationAnimationStylePopup,   // 从中心点弹出
    ModalPresentationAnimationStyleSlide    // 从下往上升起
} ModalPresentationAnimationStyle;

@protocol ModalPresentationContentViewProtocol <NSObject>

@optional

/**
 *  当浮层使用modalController提供的默认布局时，则可通过这个方法告诉modalController当前浮层期望的大小
 *  @param  controller  当前的modalController
 *  @param  limitSize   浮层最大的宽高，由当前modalController的大小及`contentViewMargins`、`maximumContentViewWidth`决定
 *  @return 返回浮层在`limitSize`限定内的大小，如果业务自身不需要限制宽度/高度，则为width/height返回CGFLOAT_MAX即可
 */
- (CGSize)preferredContentSizeInModalPresentationVC:(ModalPresentationViewController *)controller
                                          limitSize:(CGSize)limitSize;

@end


@protocol ModalPresentationViewControllerDelegate <NSObject>
@optional
- (BOOL)shouldHideModalPresentationViewController:(ModalPresentationViewController *)controller;
- (void)didHideModalPresentationViewController:(ModalPresentationViewController *)controller;
- (void)requestHideAllModalPresentationViewController;
@end

@interface ModalPresentationViewController : UIViewController

@property(nonatomic, weak) id <ModalPresentationViewControllerDelegate> delegate;

/**
 *  要被弹出的浮层
 *  @warning 当设置了`contentView`时，不要再设置`contentViewController`
 */
@property(nonatomic, strong) UIView *contentView;

/**
 *  背景遮罩，默认为一个普通的`UIView`，背景色为`UIColorMask`，可设置为自己的view，注意`dimmingView`的大小将会盖满整个控件。
 *
 *  `QMUIModalPresentationViewController`会自动给自定义的`dimmingView`添加手势以实现点击遮罩隐藏浮层。
 */
@property(nonatomic, strong) UIView *dimmingView;
/**
 *  要被弹出的浮层，适用于浮层以UIViewController的形式来管理的情况。
 *  @warning 当设置了`contentViewController`时，`contentViewController.view`会被当成`contentView`使用，因此不要再自行设置`contentView`
 *  @warning 注意`contentViewController`是强引用，容易导致循环引用，使用时请注意
 */
@property(nonatomic, strong) UIViewController<ModalPresentationContentViewProtocol> *contentViewController;
/**
 *  设置`contentView`布局时与外容器的间距，默认为(20, 20, 20, 20)
 *  @warning 当设置了`layoutBlock`属性时，此属性不生效
 */
@property(nonatomic, assign) UIEdgeInsets contentViewMargins UI_APPEARANCE_SELECTOR;

/**
 *  限制`contentView`布局时的最大宽度，默认为iPhone 6竖屏下的屏幕宽度减去`contentViewMargins`在水平方向的值，
    也即浮层在iPhone 6 Plus或iPad上的宽度以iPhone 6上的宽度为准。
 *  @warning 当设置了`layoutBlock`属性时，此属性不生效
 */
@property(nonatomic, assign) CGFloat maximumContentViewWidth UI_APPEARANCE_SELECTOR;

/**
 *  由于点击遮罩导致浮层被隐藏时的回调（区分于`hideWithAnimated:completion:`里的completion，这里是特地用于点击遮罩的情况）
 */
@property(nonatomic, copy) void (^didHideByDimmingViewTappedBlock)();

/**
 *  控制当前是否以模态的形式存在。如果以模态的形式存在，则点击空白区域不会隐藏浮层。
 *
 *  默认为NO，也即点击空白区域将会自动隐藏浮层。
 */
@property(nonatomic, assign, getter=isModal) BOOL modal;

/**
 *  标志当前浮层的显示/隐藏状态，默认为NO。
 */
@property(nonatomic, assign, readonly, getter=isVisible) BOOL visible;

/**
 *  修改当前界面要支持的横竖屏方向，默认为 SupportedOrientationMask。
 */
@property(nonatomic, assign) UIInterfaceOrientationMask supportedOrientationMask;

/**
 *  设置要使用的显示/隐藏动画的类型，默认为`ModalPresentationAnimationStyleFade`。
 *  @warning 当使用了`showingAnimation`和`hidingAnimation`时，该属性无效
 */
@property(nonatomic, assign) ModalPresentationAnimationStyle animationStyle UI_APPEARANCE_SELECTOR;


/**
 *  管理自定义的浮层布局，将会在浮层显示前、控件的容器大小发生变化时（例如横竖屏、来电状态栏）被调用
 *  @arg  containerBounds         浮层所在的父容器的大小，也即`self.view.bounds`
 *  @arg  keyboardHeight          键盘在当前界面里的高度，若无键盘，则为0
 *  @arg  contentViewDefaultFrame 不使用自定义布局的情况下的默认布局，会受`contentViewMargins`、`maximumContentViewWidth`、`contentView sizeThatFits:`的影响
 *
 *  @see contentViewMargins
 *  @see maximumContentViewWidth
 */
@property(nonatomic, copy) void (^layoutBlock)(CGRect containerBounds, CGFloat keyboardHeight, CGRect contentViewDefaultFrame);

/**
 *  管理自定义的显示动画，需要管理的对象包括`contentView`和`dimmingView`，在`showingAnimation`被调用前，`contentView`已被添加到界面上。若使用了`layoutBlock`，则会先调用`layoutBlock`，再调用`showingAnimation`。在动画结束后，必须调用参数里的`completion` block。
 *  @arg  dimmingView         背景遮罩的View，请自行设置显示遮罩的动画
 *  @arg  containerBounds     浮层所在的父容器的大小，也即`self.view.bounds`
 *  @arg  keyboardHeight      键盘在当前界面里的高度，若无键盘，则为0
 *  @arg  contentViewFrame    动画执行完后`contentView`的最终frame，若使用了`layoutBlock`，则也即`layoutBlock`计算完后的frame
 *  @arg  completion          动画结束后给到modalController的回调，modalController会在这个回调里做一些状态设置，务必调用。
 */
@property(nonatomic, copy) void (^showingAnimation)(UIView *dimmingView, CGRect containerBounds, CGFloat keyboardHeight, CGRect contentViewFrame, void(^completion)(BOOL finished));

/**
 *  管理自定义的隐藏动画，需要管理的对象包括`contentView`和`dimmingView`，在动画结束后，必须调用参数里的`completion` block。
 *  @arg  dimmingView         背景遮罩的View，请自行设置隐藏遮罩的动画
 *  @arg  containerBounds     浮层所在的父容器的大小，也即`self.view.bounds`
 *  @arg  keyboardHeight      键盘在当前界面里的高度，若无键盘，则为0
 *  @arg  completion          动画结束后给到modalController的回调，modalController会在这个回调里做一些清理工作，务必调用
 */
@property(nonatomic, copy) void (^hidingAnimation)(UIView *dimmingView, CGRect containerBounds, CGFloat keyboardHeight, void(^completion)(BOOL finished));

/**
 *  将浮层以 UIWindow 的方式显示出来
 *  @param animated    是否以动画的形式显示
 *  @param completion  显示动画结束后的回调
 */
- (void)showWithAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

/**
 *  将浮层隐藏掉
 *  @param animated    是否以动画的形式隐藏
 *  @param completion  隐藏动画结束后的回调
 *  @warning 这里的`completion`只会在你显式调用`hideWithAnimated:completion:`方法来隐藏浮层时会被调用，如果你通过点击`dimmingView`来触发`hideWithAnimated:completion:`，则completion是不会被调用的，那种情况下如果你要在浮层隐藏后做一些事情，请使用`delegate`提供的`didHideModalPresentationViewController:`方法。
 */
- (void)hideWithAnimated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

/**
 *  将浮层以 addSubview 的方式显示出来
 *
 *  @param view         要显示到哪个 view 上
 *  @param animated     是否以动画的形式显示
 *  @param completion   显示动画结束后的回调
 */
- (void)showInView:(UIView *)view animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;

/**
 *  将某个 view 上显示的浮层隐藏掉
 *  @param view         要隐藏哪个 view 上的浮层
 *  @param animated     是否以动画的形式隐藏
 *  @param completion   隐藏动画结束后的回调
 *  @warning 这里的`completion`只会在你显式调用`hideInView:animated:completion:`方法来隐藏浮层时会被调用，如果你通过点击`dimmingView`来触发`hideInView:animated:completion:`，则completion是不会被调用的，那种情况下如果你要在浮层隐藏后做一些事情，请使用`delegate`提供的`didHideModalPresentationViewController:`方法。
 */
- (void)hideInView:(UIView *)view animated:(BOOL)animated completion:(void (^)(BOOL finished))completion;
@end

@interface ModalPresentationViewController (UIAppearance)

+ (instancetype)appearance;

@end

@interface UIViewController (Helper)
/**
 *  获取当前controller里的最高层可见viewController（可见的意思是还会判断self.view.window是否存在）
 *
 *  @see 如果要获取当前App里的可见viewController，请使用<i>[Helper visibleViewController]</i>
 *
 *  @return 当前controller里的最高层可见viewController
 */
- (UIViewController *)visibleViewControllerIfExist;
@end

@interface ModalPresentationWindow : UIWindow

@end


/**********************************************************************************************************/
//  使用介绍
/*
// 自定义显示 和 隐藏动画
- (void)handleLayoutBlockAndAnimation {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    contentView.backgroundColor = [UIColor blackColor];
    contentView.layer.cornerRadius = 6;
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.text = @"hello world!";
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 0, contentView.frame.size.width, 50);
    label.center = CGPointMake(contentView.center.x, contentView.center.y - 20);
    [contentView addSubview:label];
    
    UITextField* textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(0, 0, contentView.frame.size.width, 30);
    textField.center = CGPointMake(contentView.center.x, contentView.center.y + 40);
    [contentView addSubview:textField];
    
    ModalPresentationViewController *modalViewController = [[ModalPresentationViewController alloc] init];
    modalViewController.contentView = contentView;
    //    modalViewController.layoutBlock = ^(CGRect containerBounds, CGFloat keyboardHeight, CGRect contentViewDefaultFrame) {
    //        CGFloat contentViewX = (containerBounds.origin.x - contentView.frame.origin.x)*0.5;
    //        CGFloat contentViewY = (containerBounds.origin.y - contentView.frame.origin.y)*0.5;
    //        contentView.frame = CGRectMake(100,
    //                                       100,
    //                                       (CGRectGetWidth(containerBounds)-CGRectGetWidth(contentView.frame))*0.5,
    //                                       CGRectGetHeight(containerBounds) - 20 - CGRectGetHeight(contentView.frame));
    //    };
    
    modalViewController.showingAnimation = ^(UIView *dimmingView, CGRect containerBounds, CGFloat keyboardHeight, CGRect contentViewFrame, void(^completion)(BOOL finished)) {
        //        CGFloat contentViewX = (containerBounds.origin.x - contentView.frame.origin.x)*0.5;
        //        CGFloat contentViewY = (containerBounds.origin.y - contentView.frame.origin.y)*0.5;
        //        CGFloat contentViewW = contentView.frame.size.width;
        //        CGFloat contentViewH = contentView.frame.size.height;
        //        contentView.frame = CGRectMake(100, 100, contentViewW, contentViewH);
        dimmingView.alpha = 0;
        [UIView animateWithDuration:.3 delay:0.0 options:QMUIViewAnimationOptionsCurveOut animations:^{
            dimmingView.alpha = 1;
            contentView.frame = contentViewFrame;
        } completion:^(BOOL finished) {
            // 记住一定要在适当的时机调用completion()
            if (completion) {
                completion(finished);
            }
        }];
    };
    
    modalViewController.hidingAnimation = ^(UIView *dimmingView, CGRect containerBounds, CGFloat keyboardHeight, void(^completion)(BOOL finished)) {
        [UIView animateWithDuration:.3 delay:0.0 options:QMUIViewAnimationOptionsCurveOut animations:^{
            dimmingView.alpha = 0.0;
        } completion:^(BOOL finished) {
            // 记住一定要在适当的时机调用completion()
            if (completion) {
                completion(finished);
            }
        }];
    };
    [modalViewController showWithAnimated:YES completion:nil];
}


- (void)customDimmingView{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 6;
    
    UIImageView* imageV = [[UIImageView alloc] init];
    imageV.image = [UIImage imageNamed:@"name01.jpeg"];
    
    ModalPresentationViewController *modalViewController = [[ModalPresentationViewController alloc] init];
    modalViewController.dimmingView = imageV;
    modalViewController.contentView = contentView;
    [modalViewController showWithAnimated:YES completion:nil];
}

// 内容是控制器的时候
- (void)testContentViewController{
    
    ModalContentViewController* vc = [[ModalContentViewController alloc] init];
    ModalPresentationViewController *modalViewController = [[ModalPresentationViewController alloc] init];
    modalViewController.contentViewController = vc;
    modalViewController.maximumContentViewWidth = CGFLOAT_MAX;
    [modalViewController showWithAnimated:YES completion:nil];
}

// 弹出动画，文本框键盘处理
- (void)testModalViewController{
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 6;
    
    UILabel *label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.text = @"hello world!";
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 0, contentView.frame.size.width, 50);
    label.center = CGPointMake(contentView.center.x, contentView.center.y - 20);
    [contentView addSubview:label];
    
    UITextField* textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(0, 0, contentView.frame.size.width, 30);
    textField.center = CGPointMake(contentView.center.x, contentView.center.y + 40);
    [contentView addSubview:textField];
    
    // 以Window方式弹出
    ModalPresentationViewController *modalViewController = [[ModalPresentationViewController alloc] init];
    modalViewController.contentView = contentView;
    //    modalViewController.maximumContentViewWidth = CGFLOAT_MAX;
    [modalViewController showWithAnimated:YES completion:nil];
    //    [self presentViewController:modalViewController animated:NO completion:nil];
    
    //    if (self.myModalViewController) {
    //        [self.myModalViewController hideInView:self.view animated:YES completion:nil];
    //    }
    //
    //    self.myModalViewController = [[ModalPresentationViewController alloc] init];
    //    self.myModalViewController.contentView = contentView;
    //    self.myModalViewController.animationStyle = ModalPresentationAnimationStylePopup;
    //    self.myModalViewController.view.frame = self.view.bounds;
    //    [self.myModalViewController showInView:self.view animated:YES completion:nil];
}

*/




































