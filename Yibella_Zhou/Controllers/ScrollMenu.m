//
//  ScrollMenu.m
//  Yibella_Zhou
//
//  Created by Bella on 16/3/30.
//  Copyright © 2016年 huirui.zhouyi. All rights reserved.
//

#import "ScrollMenu.h"
#import "MenuView.h"
#import "LineButtonCell.h"

@interface ScrollMenu ()<UITableViewDataSource,UITableViewDelegate,MenuChangedDelegate>

@property (weak, nonatomic) IBOutlet MenuView *menuView;


@property (weak, nonatomic) IBOutlet UITableView *dataTableView;


@property(nonatomic, strong) NSMutableArray *dataSource;

@end

static NSString *cellIdentifier = @"cell";
static NSString *lineLabelCellIndentifier = @"lineLabelCell";

@implementation ScrollMenu


#pragma mark - viewDidLoad
- (void)viewDidLoad {
    
    self.menuView.frame = CGRectMake(_menuView.bounds.origin.x, _menuView.bounds.origin.y, self.view.bounds.size.width, _menuView.bounds.size.height);
    
    [self.menuView setOriginalWithMenuNameArray:@[@"重庆",@"郊游",@"南川",@"头度",@"金佛山"]];
    self.menuView.delegate = self;
    
    self.dataTableView.delegate = self;
    self.dataTableView.dataSource = self;
    [self.dataTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.dataTableView registerNib:[UINib nibWithNibName:@"LineButtonCell" bundle:nil] forCellReuseIdentifier:lineLabelCellIndentifier];
    
    [self.dataSource addObject:@"测试"];
}


#pragma mark - UITableView DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LineButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:lineLabelCellIndentifier forIndexPath:indexPath];
    
    
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - MenuChangedDelegate
- (void)changedDataSourceWithCurrentMenu:(UIButton *)button {
    
    //清除数据源
    [self.dataSource removeAllObjects];
    
    //更新数据源
    [self.dataSource addObject:button.titleLabel.text];
    
    //更新UI
    [self.dataTableView reloadData];
}


#pragma mark - lazyLoad
- (NSMutableArray *)dataSource {
    
    if (nil == _dataSource) {
        _dataSource = [NSMutableArray array];
    }
    
    return _dataSource;
}

@end
