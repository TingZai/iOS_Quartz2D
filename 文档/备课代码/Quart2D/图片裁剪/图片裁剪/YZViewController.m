
#import "YZViewController.h"

#import "UIImage+Tool.h"

@interface YZViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self clipIconImage];
    
//    _imageView.image = [UIImage circleImageWithName:@"阿狸头像" borderWidth:3 borderColor:[UIColor redColor]];
}

- (void)clipIconImage
{
    UIImage *oldImage = [UIImage imageNamed:@"阿狸头像"];
    
    // 圆环宽度
    CGFloat boardW = 2;
    CGFloat imageW =  oldImage.size.width + 2 * boardW;
    CGFloat imageH = oldImage.size.height + 2 *boardW;
    
    // 只有正方形才能正切圆，选择一个最短的尺寸，正切。
    CGFloat circleW = imageW > imageH ? imageH : imageW;
    
    CGRect rect = CGRectMake(0, 0, circleW, circleW);
    
    // 开启图像上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    
    // 画外圆
    UIBezierPath *path  = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(ctx, path.CGPath);
    
    [[UIColor whiteColor] set];
    
    CGContextFillPath(ctx);
    
    rect = CGRectMake(boardW, boardW, oldImage.size.width , oldImage.size.height);
    
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    // 根据这个路径进行裁剪，超出路径以外的部分就不会显示了
    [clipPath addClip];
    
    // 画头像
    [oldImage drawInRect:rect];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    _imageView.image = newImage;

}

- (void)clipIcon
{
    UIImage *oldImage = [UIImage imageNamed:@"阿狸头像"];
    
    // 1.开启图像上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    
    // 抽出来，因为后面画圆和头像都需要用到这个变量,以后我只要改这里，后面就跟着改了。
    CGRect rect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);
    
    // 在上下文中画一个圆
    // 2.利用贝塞尔路径画圆,圆正切与图像上下文
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    // 根据这个路径进行裁剪，超出路径以外的部分就不会显示了
    // 3.裁剪路径
    [path addClip];
    
    // 4.画头像
    [oldImage drawInRect:rect];
    
    //5. 获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文（有开就有关）
    UIGraphicsEndImageContext();
    
    _imageView.image = newImage;

}


@end
