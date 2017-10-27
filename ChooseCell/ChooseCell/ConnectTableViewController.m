//
//  ConnectTableViewController.m
//  ChooseCell
//
//  Created by xrh on 2017/10/27.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "ConnectTableViewController.h"
#import "ConnectModel.h"
#import "ConnectTableViewCell.h"

@interface ConnectTableViewController ()<UITableViewDataSource,UITableViewDelegate,CellDelegate>
{
    NSMutableArray *array;
    NSMutableDictionary *cellMarkDic;
    NSMutableArray *cellMarkArray;
}


@end

@implementation ConnectTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ConnectTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"connectCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    array = [NSMutableArray array];
    cellMarkArray = [NSMutableArray array];
    
    for (int i = 0; i<5; i++) {
        cellMarkDic = [NSMutableDictionary dictionary];
        ConnectModel *model = [[ConnectModel alloc] init];
        model.title = @" 2015年10月，十八届五中全会决定，全面实施二孩政策，据图推测最主要的原因是:";
        model.one = @"A．我国人口数量开始在减少，为了补充劳动力人口数量";
        model.two = @"B．我国人口出现人口老龄化和劳动力将不足的现象";
        model.three = @"C．我国经济发展速度快，不需要担心人口增多的问题";
        model.four = @"D．政府考虑人们的生育愿望，更多人希望有两个子女";
        [array addObject:model];
        [cellMarkDic setObject:@"0" forKey:@"cellMark"];
        [cellMarkArray addObject:cellMarkDic];
    }

}


#pragma mark -- TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ConnectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"connectCell" forIndexPath:indexPath];
    
    cell.model = array[indexPath.row];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSMutableDictionary *dic = cellMarkArray[indexPath.row];
    
    if ([[dic objectForKey:@"cellMark"] isEqualToString:@"0"]) {
        [dic setObject:@"0" forKey:@"cellMark"];
        [cell setMark:@"0"];
        
    }else if ([[dic objectForKey:@"cellMark"] isEqualToString:@"1"])
    {
        [dic setObject:@"1" forKey:@"cellMark"];
        [cell setMark:@"1"];
    }else if ([[dic objectForKey:@"cellMark"] isEqualToString:@"2"])
    {
        [dic setObject:@"2" forKey:@"cellMark"];
        [cell setMark:@"2"];
    }else if ([[dic objectForKey:@"cellMark"] isEqualToString:@"3"])
    {
        [dic setObject:@"3" forKey:@"cellMark"];
        [cell setMark:@"3"];
    }else
    {
        [dic setObject:@"4" forKey:@"cellMark"];
        [cell setMark:@"4"];
    }

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ConnectModel *model = array[indexPath.row];
    return [self getNewsHeightIsNewsPage:model];
}


-(float)getNewsHeightIsNewsPage:(ConnectModel *)model {
    float Height = 20 + [self height:model.title]+[self height:model.one]+[self height:model.two]+[self height:model.three]+[self height:model.four];
    return Height +100;
}

-(CGFloat)height:(NSString *)text {
    CGRect titleLbframe = [text boundingRectWithSize:CGSizeMake(self.view.frame.size.width-52, 9999) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil];
    return titleLbframe.size.height;
}

- (void)addButtonTager:(UIButton *)sender {
    
    //点击过后得重新刷新数组
    
    CGPoint point = sender.center;
    point = [self.tableView convertPoint:point fromView:sender.superview];
    NSIndexPath* indexpath = [self.tableView indexPathForRowAtPoint:point];
    //    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexpath];
    NSMutableDictionary *dic = cellMarkArray[indexpath.row];
    if (sender.tag == 1) {
        
        [dic setObject:@"1" forKey:@"cellMark"];
        
    }else if (sender.tag == 2)
    {
        [dic setObject:@"2" forKey:@"cellMark"];
    }else if (sender.tag == 3)
    {
        [dic setObject:@"3" forKey:@"cellMark"];
    }else
    {
        [dic setObject:@"4" forKey:@"cellMark"];
    }

}

@end
