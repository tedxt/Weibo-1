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
#import "ZYTabBar.h"

@interface ZYTabBarController ()<ZYTabBarDelegate>
/**
 *  自定义选项卡
 */
@property (nonatomic, weak) ZYTabBar *customTabBar;
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
 *  添加子控制器-
 *
 *  @param childVc           需要添加的子控制器
 *  @param title             子控制器按钮的标题
 *  @param imageName         子控制器按钮默认状态图片
 *  @param selectedImageName 子控制器按钮选中状态图片
 */
- (void)addChildViewController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childViewController.view.backgroundColor = [UIColor whiteColor];
    childViewController.tabBarItem.title = title;
    childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    UIImage *selectedImage = [UIImage imageWithNmae:selectedImageName];
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childViewController.tabBarItem.selectedImage = selectedImage;
    
    self.tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithNmae:@"tabbar_background_os7"]];
    self.tabBar.tintColor = [UIColor whiteColor];
    // 添加控制器到ZYTabBarController
    [self addChildViewController:childViewController];
    
    // 添加自控制器对应的选项卡按钮
    [self.customTabBar addTabBarButton: childViewController.tabBarItem];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建自定义TabBar
    ZYTabBar *tabBar = [[ZYTabBar alloc]init];
    tabBar.frame = self.tabBar.frame;
    
    // 设置代理
    tabBar.delegate = self;
    
    [self.view addSubview:tabBar];
    self.customTabBar = tabBar;
    
    // 2.删除系统自带的TabBar
    [self.tabBar removeFromSuperview];
    
    // 通过子控制器的索引设置需要展示的控制器
    //    self.selectedIndex = 3;
    // 通过直接设置需要显示的子控制器器
    //    self.selectedViewController = self.childViewControllers[3];
}


//- (void)tabBar:(IWTabBar *)tabBar selectedButtonIndex:(int)selectedIndex
- (void)tabBar:(ZYTabBar *)tabBar from:(int)from to:(int)to
{
    NSLog(@"from = %d, to = %d", from, to);
    self.selectedIndex = to;
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
