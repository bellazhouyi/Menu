//
//  ScrollButton.h
//  Yibella_Zhou
//
//  Created by Bella on 16/3/29.
//  Copyright © 2016年 huirui.zhouyi. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ScrollButtonDelegate <NSObject>

- (void)tagetActionwithButton:(UIButton *)button;

@end


@interface ScrollButton : UIButton

- (void)loadViewWithTitleArray:(NSArray *)titleArray;


@property(nonatomic, weak) id<ScrollButtonDelegate> delegate;

@end
