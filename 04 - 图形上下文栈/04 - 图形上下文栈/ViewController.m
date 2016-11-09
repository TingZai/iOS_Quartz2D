//
//  ViewController.m
//  04 - 图形上下文栈
//
//  Created by 余婷 on 16/1/13.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "ViewController.h"
#import "YTView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YTView * ytView = [[YTView alloc] initWithFrame:self.view.bounds];
    
    ytView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:ytView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
