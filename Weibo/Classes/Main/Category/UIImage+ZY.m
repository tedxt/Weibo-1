//
//  UIImage+ZY.m
//  Weibo
//
//  Created by zhangyang on 14-10-9.
//  Copyright (c) 2014年 Yang. All rights reserved.
//inout

#import "UIImage+ZY.h"

@implementation UIImage (ZY)

+(UIImage *)imageWithNmae:(NSString *)imageNmae
{
    // 1.定义返回结果
    UIImage *image = nil;
    // 2.判断当前系统版本
    if (iOS7) {
        // 2.1拼接图片名称
        imageNmae = [imageNmae stringByAppendingString:@"_os7"];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:imageNmae];
    }
    // 4.返回图片
    return image;

}

@end
//40701b2ccb7d498c23ab3bee57ab65d82446c35f