//
//  LineLabel.m
//  Yibella_Zhou
//
//  Created by Bella on 16/3/31.
//  Copyright © 2016年 huirui.zhouyi. All rights reserved.
//

#import "LineLabel.h"
#import "LineView.h"

@implementation LineLabel

- (void)setNameForTitle:(NSString *)title {
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    label.text = title;
    UIColor *textColor = [UIColor colorWithRed:228. / 255. green:228. / 255. blue:228. / 255. alpha:1.0];
    label.textColor = textColor;
    
    [self addSubview:label];
    
    LineView *line = [LineView new];
    line.frame = CGRectMake(label.bounds.origin.x, label.bounds.size.height + 10, label.bounds.size.width, 2);
    
    [self addSubview:line];
    
}



@end
