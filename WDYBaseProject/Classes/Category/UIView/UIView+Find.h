
#import <UIKit/UIKit.h>

@interface UIView (Find)

/** 找到指定类名的subView */
- (UIView *)findSubViewWithClass:(Class)clazz;

- (NSArray *)findAllSubViewsWithClass:(Class)clazz;

/** 找到指定类名的superView对象 */
- (UIView *)findSuperViewWithClass:(Class)clazz;

/** 找到view上的第一响应者 */
- (UIView *)findFirstResponder;

/** 找到当前view所在的viewcontroler */
- (UIViewController *)findViewController;

/** 获取cell所在的tableview,一般只是用来确定UITableViewCell的所属UITableview */
- (UITableView *)fdd_superTableView;

/** 获取view所在的tableViewCell */
- (UITableViewCell*)fdd_superTableCell;

- (NSArray *)allSubviews;

// 移除所有的子类视图
- (void)removeAllSubviews;

@end
