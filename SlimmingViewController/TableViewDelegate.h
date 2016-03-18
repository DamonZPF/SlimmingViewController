//
//  TableViewDelegate.h
//  SlimmingViewController
//
//  Created by zhoupengfei on 16/3/17.
//  Copyright © 2016年 zpf. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TableViewDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)void (^didSelectedCellBlock)(NSIndexPath*indexPath); //点击cell 传递indexPath 给控制器
//提供类方法创建对象
+(instancetype)createTableDelegateWithDateSource:(NSArray*)dataSource;

@end
