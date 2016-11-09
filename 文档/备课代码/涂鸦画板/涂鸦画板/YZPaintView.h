//
//  YZPaintView.h
//  涂鸦画板
//
//  Created by yz on 14-8-8.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZPaintView : UIView

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, strong) UIImage *image;

- (void)clearScreen;
- (void)undo;

@end
