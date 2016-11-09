//
//  ViewController.m
//  11 - 水印
//
//  Created by 余婷 on 16/1/19.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+YTImage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取到应用程序中UIApplication单例对象
    UIApplication * app = [UIApplication sharedApplication];
    //设置应用程序图标右上角的红色提醒数字
    app.applicationIconBadgeNumber = 99;
    
    //在IOS8以后要想设置applicationIconBadgeNumber，需要用户的授权，在IOS8以后，需要加上下面的代码
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 8.0) {
        
        UIUserNotificationSettings * settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        [app registerUserNotificationSettings:settings];
    }

    
    
    //设置状态栏的样式
    //app.statusBarStyle = UIStatusBarStyleDefault; //默认(黑色)
    app.statusBarStyle = UIStatusBarStyleLightContent;  //白色
    
    //设置是否隐藏状态栏
    app.statusBarHidden = NO;
    
    
//    [app openURL:[NSURL URLWithString:@"tel://13683077207"]];
    [app openURL:[NSURL URLWithString:@"sms://13683077207"]];
    
    
    //设置联网指示器可见
    app.networkActivityIndicatorVisible = YES;
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    //=========水印========
    UIImage * image = [UIImage waterImageWithBg:@"1.jpg" logo:@"luffy"];
    self.iconImageView.image = image;
}


- (void)waterTest{

    UIImage * bgImage = [UIImage imageNamed:@"1.jpg"];
    
    //上下文：基于位图（bitmap），所有东西需要会绘制到一张图片上去
    //1.创建一个基于位图的上下文
    //size:新图片的尺寸
    //opaque: YES:不透明 NO:透明
    //scale:
    //这行代码运行后就相当于创建一张新的bitmap，也就是新的UIImage对象
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    //2.画背景
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    //3.画右下角的水印
    UIImage * waterImage = [UIImage imageNamed:@"luffy"];
    
    CGFloat scale = 1.0f;
    CGFloat margin = 5;
    CGFloat waterW = waterImage.size.width * scale;
    CGFloat waterH = waterImage.size.height * scale;
    CGFloat waterX = bgImage.size.width - waterW - margin;
    CGFloat waterY = bgImage.size.height - waterH - margin;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    //4.从上下文中取得制作完成的UIImage对象
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.结束上下文
    UIGraphicsEndImageContext();
    
    //6.显示到UIImageView上
    self.iconImageView.image = newImage;
    
    //7.将image对象压缩为PNG格式的二进制数据
    NSData * data = UIImagePNGRepresentation(newImage);
    
    //8.写入文件
    //
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    
    //UIStatusBarStyleDefault        //默认，黑色
    //UIStatusBarStyleLightContent   //白色
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden{

    return YES;
}

@end
