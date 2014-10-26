//
//  UIView+ZY.h
//  Weibo
//
//  Created by zhangyang on 14-10-11.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZY)


//#warning 注意, 如果在分类中使用@property, 只会生成get/set方法的声明, 不会生成实现以及添加下划线开头的属性
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@end
