//
//  ViewController.m
//  01-基本图形绘制
//
//  Created by 余婷 on 16/1/12.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "BasisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BasisView * bView = [[BasisView alloc] initWithFrame:CGRectMake(20, 40, 300, 300)];
    
    bView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:bView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
