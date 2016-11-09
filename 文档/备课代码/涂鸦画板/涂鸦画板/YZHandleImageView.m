/*
    transform:底层是通过找到需要形变对象的父类，调用父类的layoutSubviews，改变他的frame，bounds不会改变。因为frame能决定他在父控件显示的位置和尺寸。
 
    选择图片处理：创建UIImageView，默认是不支持交互的。
                给UIImageView，因为是处理图片。
                设置的是UIImageView的形变。
                注意复位。
                长按会调用两次，我们只需要做一次操作，在手势开始的时候，弄个高亮的效果。
 
 */

#import "YZHandleImageView.h"
#import "UIImage+Tool.h"

@interface YZHandleImageView()<UIGestureRecognizerDelegate>
@property (nonatomic, weak) UIImageView *imageV;

@end

@implementation YZHandleImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        


        // 1.添加imageView
        [self addImageView];
        
        // 2.添加手势
        [self addGestures];
        
    }
    return self;
}

- (void)addImageView
{
    UIImageView *iV = [[UIImageView alloc] initWithFrame:self.bounds];
    iV.userInteractionEnabled = YES;
    _imageV = iV;
    [self addSubview:_imageV];
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    NSLog(@"layoutSubviews%@", NSStringFromCGRect(_imageV.frame));
//    _imageV.frame = self.bounds;
//    [self addGestures];
//}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    _imageV.image = image;

}
- (void)addGestures
{
    // 1.拖动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_imageV addGestureRecognizer:pan];
    
    // 2.旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [_imageV addGestureRecognizer:rotation];
    // 3.捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [_imageV addGestureRecognizer:pinch];
    
    // 4.长按
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [_imageV addGestureRecognizer:longPress];
    
    // 5.点按
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [_imageV addGestureRecognizer:tap];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    [UIView animateWithDuration:0.25 animations:^{
        
        _imageV.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.25 animations:^{
            _imageV.alpha = 1;
        } completion:^(BOOL finished) {
            // 截屏
            UIImage *image = [UIImage captureWithView:self];
            
            // 将图片传给控制器
            if (_block) {
                _block(image);
            }
            
            // 处理图片完毕,销毁当前视图
            [self removeFromSuperview];
        }];
        
    }];

}

- (void)pan:(UIPanGestureRecognizer *)pan
{
    CGPoint pos = [pan translationInView:_imageV];
    _imageV.transform = CGAffineTransformTranslate(_imageV.transform, pos.x, pos.y);
    
    // 复位
    [pan setTranslation:CGPointZero inView:_imageV];
    
}
- (void)rotation:(UIRotationGestureRecognizer *)rotation
{
    _imageV.transform = CGAffineTransformRotate(_imageV.transform, rotation.rotation);
    rotation.rotation = 0;
}
- (void)pinch:(UIPinchGestureRecognizer *)pinch
{

    _imageV.transform = CGAffineTransformScale(_imageV.transform, pinch.scale, pinch.scale);
    
    // 复位
    pinch.scale = 1;
}

// 这个方法会调用两次，长按开始一次，结束一次
- (void)longPress:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        [UIView animateWithDuration:0.25 animations:^{
           
            _imageV.alpha = 0.5;
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.25 animations:^{
                _imageV.alpha = 1;
            } completion:^(BOOL finished) {
                // 截屏
                UIImage *image = [UIImage captureWithView:self];
                // 将图片传给控制器
                if (_block) {
                    _block(image);
                }
                
                // 处理图片完毕,销毁当前视图
                [self removeFromSuperview];
            }];
            
        }];
        
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
