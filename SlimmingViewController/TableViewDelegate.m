//
//  TableViewDelegate.m
//  SlimmingViewController
//
//  Created by zhoupengfei on 16/3/17.
//  Copyright © 2016年 zpf. All rights reserved.
//

#import "TableViewDelegate.h"
@interface TableViewDelegate()

@property(nonatomic,copy)NSArray * dataSource;

@end

@implementation TableViewDelegate

+(instancetype)createTableDelegateWithDateSource:(NSArray*)dataSource{
    return [[[self class] alloc] initWithTableDelegateWithDataSource:dataSource];
}

-(id)initWithTableDelegateWithDataSource:(NSArray*)dataScource{
    self = [super init];
    if (self) {
        self.dataSource = dataScource;
    }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"CellIdentifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectedCellBlock) {
        self.didSelectedCellBlock(indexPath);
    }
}

@end
