//
//  YTPath.m
//  画板
//
//  Created by 余婷 on 16/3/22.
//  Copyright © 2016年 余婷. All rights reserved.
//

#import "YTPath.h"

@implementation YTPath

- (instancetype)init{

    if (self = [super init]) {
        
        _path = [UIBezierPath bezierPath];
        _lineColor = [UIColor blackColor];
        
    }
    
    return self;
}

@end
