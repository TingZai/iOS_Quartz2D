//
//  VCView.m
//  手势解锁
//
//  Created by 余婷 on 16/3/22.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "VCView.h"

@implementation VCView

- (void)drawRect:(CGRect)rect{

    UIImage * image = [UIImage imageNamed:@"Home_refresh_bg"];
    
    [image drawInRect:rect];
}

@end
