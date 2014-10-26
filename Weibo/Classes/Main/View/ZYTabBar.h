//
//  ZYTabBar.h
//  Weibo
//
//  Created by zhangyang on 14-10-11.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYTabBar;

@protocol ZYTabBarDelegate <NSObject>

//- (void)tabBar:(ZYTabBar *)tabBar selectedButtonIndex:(int) selectedIndex;
- (void)tabBar:(ZYTabBar *)tabBar from:(int)from to:(int)to;

@end

@interface ZYTabBar : UIView
/**
 *  添加选项卡按钮
 *
 *  @param item 选项卡按钮需要显示的数据
 */
- (void)addTabBarButton:(UITabBarItem *)item;

@property (nonatomic, weak) id<ZYTabBarDelegate> delegate;
@end
