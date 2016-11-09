

#import "YZViewController.h"

@interface YZViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 新的图片大小和背景图片一样大
    
    // 背景图片
    UIImage *bg = [UIImage imageNamed:@"头像1"];
    
    // 1.开启图像上下文,这种比较清晰
    /* size:图像上下文尺寸相当于新的图片尺寸
       opaque:YES ：不透明 No ：透明
       0.0:不需要伸缩
    */
    UIGraphicsBeginImageContextWithOptions(bg.size, NO, 0.0);
    
    // 2.画背景
    [bg drawInRect:CGRectMake(0, 0, bg.size.width, bg.size.height)];
    
    // 3.画文字
    NSString *str = @"我要高薪";
    
    [str drawAtPoint:CGPointMake(130, 170) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    // 现在是不是画完了啊，画完之后，我怎么拿到新的图片了，这时候直接取就好了
    // 4.从图像上下文中生成一张新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    
    _imageView.image = newImage;
    
    // 6.产生的这张新的图片，我想保存起来，以后用，怎么搞，是不是要写入桌面啊，image能写入吗，是不是不能啊，怎么写了，
    // 可以把image转化成NSData,利用NSData写入
    // 生成jpeg格式的图片,这个不是很清晰，我们一般生成png，png默认是最清晰的图片
//    NSData *d = UIImageJPEGRepresentation(newImage, 1);
    
    // UIImage转化NSData
    NSData *data = UIImagePNGRepresentation(newImage);
    // 拼接图片名称
    NSString *filePath = [@"/Users/yuanzheng/Desktop" stringByAppendingPathComponent:@"water.png"];
    
    // 写入桌面
    [data writeToFile:filePath atomically:YES];
    
    
    
    
}

@end
