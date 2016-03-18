//
//  ViewController.m
//  SlimmingViewController
//
//  Created by zhoupengfei on 16/3/17.
//  Copyright © 2016年 zpf. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDelegate.h"
@interface ViewController ()
@property(nonatomic,strong)TableViewDelegate * tableViewDelegate;
@property(nonatomic,strong)NSMutableArray * dataSource;
@end

@implementation ViewController
//懒加载 委托代理类
-(TableViewDelegate*)tableViewDelegate{
    if (_tableViewDelegate == nil) {
        _tableViewDelegate = [TableViewDelegate createTableDelegateWithDateSource:self.dataSource];
    }
    return _tableViewDelegate;
}
//懒加载 数据源
-(NSMutableArray*)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
        for (NSInteger index = 0; index < 20; index++) {
            [_dataSource addObject:[NSString stringWithFormat:@"indexPath %ld",(long)index]];
        }
    }
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //指着代理对象
    self.tableView.dataSource = self.tableViewDelegate;
    self.tableView.delegate = self.tableViewDelegate;
    //点击Cell 回调block
    self.tableViewDelegate.didSelectedCellBlock = ^(NSIndexPath* indexPath){
        NSLog(@"___%ld",(long)indexPath.row);
    };
}


@end
