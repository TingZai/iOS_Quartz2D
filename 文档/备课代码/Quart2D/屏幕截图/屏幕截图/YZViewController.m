

#import "YZViewController.h"

@interface YZViewController ()

- (IBAction)capture:(UIButton *)sender;

@end

@implementation YZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

     NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].bounds));
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@",NSStringFromCGRect([UIScreen mainScreen].applicationFrame));
}


- (IBAction)capture:(UIButton *)sender {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 1.开启上下文
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0.0);
        
        // 2.获取当前上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 3.把控制器图层渲染到上下文
        [self.view.layer renderInContext:ctx];
        
        // 4.取出新图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        // 把图片保存起来
        NSData *data = UIImagePNGRepresentation(newImage);
        
        
        NSString *filePath = [@"/Users/yuanzheng/Desktop" stringByAppendingPathComponent:@"view.png"];
        
        [data writeToFile:filePath atomically:YES];

    });

    
}
@end
