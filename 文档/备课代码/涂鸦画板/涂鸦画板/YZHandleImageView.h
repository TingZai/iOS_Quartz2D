//
//  YZHandleImageView.h
//  涂鸦画板
//
//  Created by yz on 14-8-8.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YZHandleImageViewBlock)(UIImage *image);

@interface YZHandleImageView : UIView

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, copy) YZHandleImageViewBlock block;

@end
