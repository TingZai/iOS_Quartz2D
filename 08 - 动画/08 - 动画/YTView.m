//
//  YTView.m
//  08 - 动画
//
//  Created by 余婷 on 16/1/14.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTView.h"

@interface YTView()
@property(nonatomic, assign) CGFloat snowY;
@end

@implementation YTView

//当view从storyBoad上创建的时候会调用这个方法
- (void)awakeFromNib{

//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void)drawRect:(CGRect)rect{

    [super drawRect:rect];
    
    self.snowY ++;
    
    if (self.snowY >= rect.size.height) {
        
        self.snowY = -100;
    }
    
    UIImage * image = [UIImage imageNamed:@"snow_flake"];
    [image drawAtPoint:CGPointMake(0, self.snowY)];
}

@end
