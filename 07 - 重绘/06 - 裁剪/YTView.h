//
//  YTView.h
//  06 - 裁剪
//
//  Created by 余婷 on 16/1/14.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTView : UIView

//圆的半径
@property(nonatomic, assign) CGFloat radius;

@property(nonatomic, assign) CGPoint startPoint;
@property(nonatomic, assign) CGPoint endPoint;
@property(nonatomic, assign) CGPoint controlPoint;

@end
