//
//  MenuView.h
//  Yibella_Zhou
//
//  Created by Bella on 16/3/30.
//  Copyright © 2016年 huirui.zhouyi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  菜单项改变后,改变相应的数据源 协议
 */
@protocol MenuChangedDelegate <NSObject>

- (void)changedDataSourceWithCurrentMenu:(UIButton *)button;

@end


/**
 *  菜单项 类
 */
@interface MenuView : UIView


@property(nonatomic, weak) id<MenuChangedDelegate> delegate;


- (void)setOriginalWithMenuNameArray:(NSArray *)menuArray;

@end
