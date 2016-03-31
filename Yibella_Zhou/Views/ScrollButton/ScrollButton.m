//
//  ScrollButton.m
//  Yibella_Zhou
//
//  Created by Bella on 16/3/29.
//  Copyright © 2016年 huirui.zhouyi. All rights reserved.
//

#import "ScrollButton.h"

@implementation ScrollButton

#pragma mark - 根据菜单数组创建菜单项
- (void)loadViewWithTitleArray:(NSArray *)titleArray {
    
    //尺寸
    CGSize size = self.bounds.size;
    
    //间隔
    CGFloat space = size.width / titleArray.count;
    
    //添加菜单项
    for (int index = 0; index < titleArray.count; index ++) {
        
        UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //分割,每个菜单项的坐标
        menuButton.frame = CGRectMake(space * index, self.bounds.origin.y, space, size.height - zySCROLLBUTTON_MENUITEM_HEIGHT * 2);
        
        //设置菜单项 名称
        [menuButton setTitle:titleArray[index] forState:UIControlStateNormal];
        
        //默认选中第一个菜单项
        if (0 == index) {
            
            [menuButton setTitleColor:zySCROLLBUTTON_CHANGED_TITLECOLOR forState:UIControlStateNormal];
        }else{
            
            [menuButton setTitleColor:zySCROLLBUTTON_ORIGINAL_TITLECOLOR forState:UIControlStateNormal];
        }
        
        //menuButton的点击事件
        [menuButton addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置menuButton的tag值
        menuButton.tag = zySCROLLBUTTON_ORIGINALTAGVALUE + index;
        
        [self addSubview:menuButton];
        
    }
}

#pragma mark - 菜单项点击事件
- (void)menuAction:(UIButton *)button {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tagetActionwithButton:)]) {
        
        [self.delegate tagetActionwithButton:button];
    }
}


@end
