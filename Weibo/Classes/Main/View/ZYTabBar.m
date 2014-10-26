//
//  ZYTabBar.m
//  Weibo
//
//  Created by zhangyang on 14-10-11.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "ZYTabBar.h"
#import "ZYTabBarButton.h"
// 折叠所有代码
// command + option + shift + ←
// 另外一个相反
@interface ZYTabBar()
/**
 *  加号按钮
 
 */
@property (nonatomic, weak) UIButton *plusBtn;
/**
 *  保存所有选项卡按钮
 */
@property (nonatomic, strong) NSMutableArray *buttons;
/**
 *  当前选中按钮
 */
@property (nonatomic, weak) ZYTabBarButton *selectedButton;
@end

@implementation ZYTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.设置背景
        [self bg];
        
        // 2.添加加号按钮
        [self addPlusBtn];
        
        // 3.添加选项卡按钮
        //        [self addTabbarButton];
    }
    return self;
}



/**
 *  添加选项卡按钮
 *  一个子控制器对应一个选项卡按钮
 *  选项卡按钮上显示什么内容, 由子控制器确认
 *  所以添加选项卡按钮不能再自定义IWTabBar中写死
 */
- (void)addTabBarButton:(UITabBarItem *)item
{
    // 1.创建按钮
    //    UIButton *btn = [[UIButton alloc] init];
    ZYTabBarButton *btn = [[ZYTabBarButton alloc] init];
    btn.item = item;
    
    // 2.设置按钮的tag
    btn.tag = self.buttons.count;// 0 1 2 3
    
    // 4.监听按钮点击事件
    [btn addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchDown];
    
    // 5.添加按钮到自定义TabBar
    [self addSubview:btn];
    
    // 6.将按钮添加到数组中
    [self.buttons addObject:btn];
    
    if (self.buttons.count == 1) {
        [self tabBarButtonClick:btn];
    }
}

//- (void)tabBarButtonClick:(UIButton *)btn
- (void)tabBarButtonClick:(ZYTabBarButton *)btn
{
    /*
     // 0.通知代理
     if ([self.delegate respondsToSelector:@selector(tabBar:selectedButtonIndex:)]) {
     [self.delegate tabBar:self selectedButtonIndex:btn.tag];
     }
     */
    
    if ([self.delegate respondsToSelector:@selector(tabBar:from:to:)]) {
        [self.delegate tabBar:self from:self.selectedButton.tag to:btn.tag];
    }
    
    //    IWLog(@"点击选项卡按钮");
    // 1.取消当前选中
    self.selectedButton.selected = NO;
    // 2.选中当前点击
    btn.selected = YES;
    // 3.记录当前选中
    self.selectedButton = btn;
}

/**
 *  添加加号按钮
 */
- (void)addPlusBtn
{
    
    // 1.创建按钮
    UIButton *plusBtn = [[UIButton alloc] init];
    
    // 2.设置背景图片
    [plusBtn setBackgroundImage:[UIImage imageWithNmae:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageWithNmae:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    // 3.设置图标
    [plusBtn setImage:[UIImage imageWithNmae:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusBtn setImage:[UIImage imageWithNmae:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    // 4.添加
    [self addSubview:plusBtn];
    self.plusBtn = plusBtn;
    
}
/**
 *  设置背景
 */
- (void)bg
{
    if (!iOS7) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithNmae:@"tabbar_background"]];
    }else
    {
#warning 后期会优化
        self.backgroundColor = [UIColor whiteColor];
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置加号按钮frame
    [self setupPlusBtnFrame];
    
    
    // 2.设置选项卡按钮frame
    [self setupTabBarButtonFrame];
    
}
/**
 *  设置选项卡按钮frame
 */
- (void)setupTabBarButtonFrame
{
    int count = self.buttons.count;
    CGFloat btnW = self.width / (count + 1);
    CGFloat btnH = self.height;
    
    
    for (int i = 0; i < count; i++) {
        
        // 2.1取出对应位置的按钮
        UIButton *btn = self.buttons[i];
        // 2.2计算按钮frame
        CGFloat btnY = 0;
        CGFloat btnX = i * btnW;
        
        // 如果是中间按钮就跳过
        if (i >= count/2) {
            btnX = (i + 1) * btnW;
        }
        // 2.3设置按钮frame
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        /*
         // 设置默认选中
         if (i == 0) {
         //            btn.selected = YES;
         [self tabBarButtonClick:btn];
         }
         */
    }
    
}
/**
 *  设置加号按钮frame
 */
- (void)setupPlusBtnFrame
{
    // 1.2设置宽高
    CGSize imageSize = self.plusBtn.currentBackgroundImage.size;
    self.plusBtn.width = imageSize.width;
    self.plusBtn.height = imageSize.height;
    
    // 1.1设置位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
}

#pragma makr - 懒加载
- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


@end

