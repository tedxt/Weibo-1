//
//  ZYTabBarController.m
//  Weibo
//
//  Created by zhangyang on 14-10-8.
//  Copyright (c) 2014年 Yang. All rights reserved.
//

#import "ZYTabBarController.h"
#import "ZYHomeViewController.h"
#import "ZYMessageViewController.h"
#import "ZYDiscoverViewController.h"
#import "ZYProfileViewController.h"


@interface ZYTabBarController ()

@end

@implementation ZYTabBarController


// init方法内部会自动调用initWithNibName方
- (instancetype)init
{
    
    self = [super init];
    if (self) {
        debugMethod();
    }
    return self;
}

// 初始化数据
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    debugMethod();
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // 1.首页
        ZYHomeViewController *home = [[ZYHomeViewController alloc] init];
        [self addChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
        
        // 2.消息
        ZYMessageViewController *message = [[ZYMessageViewController alloc] init];
        [self addChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
        
        // 3.广场
        ZYDiscoverViewController *discover = [[ZYDiscoverViewController alloc] init];
        [self addChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
        
        // 4.我
        ZYProfileViewController *profile = [[ZYProfileViewController alloc] init];
        [self addChildViewController:profile title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    }
    
    return self;
}

/**
 *  添加子控制器
 *
 *  @param childVc           需要添加的子控制器
 *  @param title             子控制器按钮的标题
 *  @param imageName         子控制器按钮默认状态图片
 *  @param selectedImageName 子控制器按钮选中状态图片
 */
- (void)addChildViewController:(UIViewController *)subviewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    subviewController.view.backgroundColor = [UIColor greenColor];
    subviewController.tabBarItem.title = title;
    subviewController.tabBarItem.image = [UIImage imageNamed:imageName];
    subviewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    [self addChildViewController:subviewController];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
