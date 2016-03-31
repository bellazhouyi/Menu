//
//  LineView.m
//  Yibella_Zhou
//
//  Created by Bella on 16/3/29.
//  Copyright © 2016年 huirui.zhouyi. All rights reserved.
//

#import "LineView.h"

@implementation LineView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
// 调用setNeedsDisplay会自动调用drawRect
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //获得处理上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置线条样式
    CGContextSetLineCap(context, kCGLineCapSquare);
    
    //设置线条粗细宽度
    CGContextSetLineWidth(context, 1.0);
    
    //设置线条颜色
    CGContextSetRGBStrokeColor(context, 114.0/255., 124.0/255., 114.0/255., 1.0);
    
    //开始一个起始路径
    CGContextBeginPath(context);
    
    //起始点设置为(0,10):注意这是上下文对应区域中的相对坐标
    CGContextMoveToPoint(context, 0, 10);
    
    //下一个坐标点
    CGContextAddLineToPoint(context, 100, 10);
    
    //连接上面定义的坐标点
    CGContextStrokePath(context);
}



@end
