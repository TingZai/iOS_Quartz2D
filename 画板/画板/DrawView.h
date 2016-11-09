//
//  DrawView.h
//  画板
//
//  Created by 余婷 on 16/3/22.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView
//是否为橡皮擦
@property(nonatomic, assign) BOOL isEraser;
//笔的颜色
@property(nonatomic, strong) UIColor *penColor;
//线宽
@property(nonatomic, assign) CGFloat lineWidth;

//图片
@property(nonatomic, strong) UIImage * image;

//清屏
- (void)clear;

//撤销
- (void)cancel;

//保存
- (void)save;

- (void)drawImage:(UIImage *)image;

@end
