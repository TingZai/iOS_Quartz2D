//
//  ViewController.m
//  10 - 模仿UIImageView
//
//  Created by 余婷 on 16/1/18.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "YTImageView.h"

@interface ViewController ()

@property(nonatomic ,strong)YTImageView * imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _imageView = [[YTImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.image = [UIImage imageNamed:@"1.jpg"];
    
    [self.view addSubview:_imageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    _imageView.image = [UIImage imageNamed:@"luffy.png"];
}

@end
