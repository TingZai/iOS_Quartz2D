

#import "YZViewController.h"
#import "YZLockView.h"
@interface YZViewController ()<YZLockViewDelegate>

@end

@implementation YZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)lockView:(YZLockView *)lockView didFinishPath:(NSString *)path
{
    NSLog(@"拿到解锁路径---%@",path);
}

@end
