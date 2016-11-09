//
//  ViewController.m
//  02-画图片和文字
//
//  Created by 余婷 on 16/1/13.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "TextImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TextImageView * bgview = [[TextImageView alloc] initWithFrame:CGRectMake(20, 20, self.view.bounds.size.width - 40, self.view.bounds.size.height - 40)];
    
    
    bgview.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:bgview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
