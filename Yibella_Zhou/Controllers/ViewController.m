//
//  ViewController.m
//  Yibella_Zhou
//
//  Created by Bella on 16/3/29.
//  Copyright © 2016年 huirui.zhouyi. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"

@interface ViewController ()<MenuChangedDelegate>

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    MenuView *menu = [[MenuView alloc] init];
    menu.frame = CGRectMake(0, 40, self.view.bounds.size.width, 50);
    
    [menu setOriginalWithMenuNameArray:@[@"重庆",@"郊游",@"景区",@"南川",@"头度",@"金佛山"]];
    
    [self.view addSubview:menu];
    
    menu.delegate = self;
    
}

#pragma mark - MenuChangedDelegate
- (void)changedDataSourceWithCurrentMenu:(UIButton *)button {
    NSLog(@"%@",button.titleLabel.text);
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    ScrollTableView *scrollTVC = [ScrollTableView new];
//    
//    [self.navigationController pushViewController:scrollTVC animated:YES];
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
