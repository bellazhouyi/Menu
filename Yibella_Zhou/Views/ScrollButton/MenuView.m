//
//  MenuView.m
//  Yibella_Zhou
//
//  Created by Bella on 16/3/30.
//  Copyright © 2016年 huirui.zhouyi. All rights reserved.
//

#import "MenuView.h"
#import "ScrollButton.h"
#import "LineView.h"


@interface MenuView ()<ScrollButtonDelegate>

@property(nonatomic, strong) ScrollButton *scrollButton;

@property(nonatomic, strong) NSArray *menuArray;

@property(nonatomic, strong) LineView *line;

@end


@implementation MenuView

#pragma mark - 根据菜单项名称数据 初始化菜单项
- (void)setOriginalWithMenuNameArray:(NSArray *)menuArray {
    
    //创建scrollButton
    ScrollButton *scrollButton = [ScrollButton new];
    self.scrollButton = scrollButton;
    
    //设置大小
    scrollButton.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y,self.bounds.size.width, self.bounds.size.height);
    
    self.menuArray = [NSArray arrayWithArray:menuArray];
    
    //创建每一个菜单,分割scrollButton的大小
    [scrollButton loadViewWithTitleArray:_menuArray];
    
    //设置代理
    scrollButton.delegate = self;
    
    [self addSubview:scrollButton];
    
    //默认下划线位置
    [scrollButton addSubview:self.line];
    
}

#pragma mark - ScrollButtonDelegate
- (void)tagetActionwithButton:(UIButton *)button {
    
    //遍历父视图中的子视图
    for (UIView *sonButton in [button.superview subviews]) {
        
        //若是发现是UIButton类的,先设置默认颜色
        if ([sonButton isKindOfClass:[UIButton class]]) {
            
            [(UIButton *)sonButton setTitleColor:zySCROLLBUTTON_ORIGINAL_TITLECOLOR forState:UIControlStateNormal];
        }
    }
    
    //button点击后,改变颜色
    [button setTitleColor:zySCROLLBUTTON_CHANGED_TITLECOLOR forState:UIControlStateNormal];
    
    //得到当前button的索引值 所对应的数组下标
    NSInteger index = button.tag % zySCROLLBUTTON_ORIGINALTAGVALUE;
    
    NSTimeInterval duration = 0.5;
    
    //动画加载下划线
    [UIView animateWithDuration:duration animations:^{
        
        //设置下划线的坐标位置
        self.line.frame = CGRectMake(button.bounds.size.width * index, button.bounds.size.height + zySCROLLBUTTON_MENUITEM_HEIGHT, button.bounds.size.width, zySCROLLBUTTON_MENUITEM_HEIGHT);
        
        //添加
        [button.superview addSubview:_line];
    }];
    
    //代理存在,并响应该代理方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(changedDataSourceWithCurrentMenu:)]) {
        
        [self.delegate changedDataSourceWithCurrentMenu:button];
    }
}

#pragma mark - getter
- (LineView *)line {
    
    if (nil == _line) {
        
        //下划线默认坐标值
        CGRect defaultLineFrame = CGRectMake(0, self.scrollButton.bounds.size.height - zySCROLLBUTTON_MENUITEM_HEIGHT, _scrollButton.bounds.size.width / _menuArray.count, zySCROLLBUTTON_MENUITEM_HEIGHT);
        
        _line = [[LineView alloc] initWithFrame:defaultLineFrame];
        
        [[_scrollButton.subviews firstObject] addSubview:_line];
    }
    
    return _line;
}

#pragma mark - dealloc
- (void)dealloc {
    
    _line = nil;
}

@end
