

#import "YZViewController.h"

#import "YZPaintView.h"

#import "YZHandleImageView.h"

#import "MBProgressHUD+MJ.h"

@interface YZViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
- (IBAction)valueChange:(UISlider *)sender;
- (IBAction)colorClick:(UIButton *)sender;
- (IBAction)clearScreen:(id)sender;
- (IBAction)undo:(id)sender;
- (IBAction)eraser:(id)sender;
- (IBAction)selectPicture:(id)sender;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet YZPaintView *paintView;

@end

@implementation YZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)valueChange:(UISlider *)sender {
    _paintView.width = sender.value;
}

- (IBAction)colorClick:(UIButton *)sender {
    _paintView.color = sender.backgroundColor;
}

- (IBAction)clearScreen:(id)sender {
    
    // 将画板里面的数组清空，重绘下
    [self.paintView clearScreen];
}

- (IBAction)undo:(id)sender {
    // 将画板数组的最后一个元素
    [self.paintView undo];
}

- (IBAction)eraser:(id)sender {
    // 设置白色的路径
    self.paintView.color = [UIColor whiteColor];
    
}

- (IBAction)selectPicture:(id)sender {
    
    // 照片查看器
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    // 设置数据源
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    // 设置代理
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    // 将当期画板视图截屏啊
    // 开启图像上下文
    UIGraphicsBeginImageContextWithOptions(_paintView.bounds.size, NO, 0);
    
    // 获取当期上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 将图层渲染到上下文
    [_paintView.layer renderInContext:ctx];
    // 取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 将图片保存到相册
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
//    UIImageView *imgV = [[UIImageView alloc] initWithImage:info[UIImagePickerControllerOriginalImage]];
//    
//    [self.view addSubview:imgV];
    
//    self.paintView.image = info[UIImagePickerControllerOriginalImage];
     YZHandleImageView *handleV = [[YZHandleImageView  alloc] initWithFrame:self.paintView.frame];
    
    handleV.image = info[UIImagePickerControllerOriginalImage];
    
    
    handleV.block = ^(UIImage *image){
    
        self.paintView.image = image;

    };
    [self.view addSubview:handleV];
    
    // 让照片查看器消失
    [picker dismissViewControllerAnimated:YES completion:nil];

}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (!error) { // 保存成功
        [MBProgressHUD showSuccess:@"保存成功"];
    }else{
        [MBProgressHUD showError:@"保存失败"];
    }
}

@end
