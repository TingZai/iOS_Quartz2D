//
//  ViewController.m
//  画板
//
//  Created by 余婷 on 16/3/22.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clear:(id)sender {
    
    [_drawView clear];
    
}
- (IBAction)cancel:(id)sender {
    
    [_drawView cancel];
}
- (IBAction)eraser:(UIButton *)sender {
    
    if (_drawView.isEraser) {
        
        _drawView.isEraser = NO;
        sender.selected = NO;
        
    }else{
    
        sender.selected = YES;
        _drawView.isEraser = YES;
    }
    
    
}
- (IBAction)addImage:(id)sender {
    
    UIImagePickerController * pick = [[UIImagePickerController alloc] init];
    
    [pick setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    pick.delegate = self;
    
    [self presentViewController:pick animated:YES completion:nil];
    
}

- (IBAction)save:(id)sender {
    
    [_drawView save];
}

- (IBAction)penColor:(UIButton*)sender{

    _drawView.penColor = sender.backgroundColor;
}

- (IBAction)changeLineWidth:(UISlider *)sender {
    _drawView.lineWidth = sender.value;
}


#pragma mark - UIImagePicker Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    NSLog(@"%@", info);
    UIImage * image = info[@"UIImagePickerControllerOriginalImage"];
    
    [_drawView drawImage:image];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

@end
