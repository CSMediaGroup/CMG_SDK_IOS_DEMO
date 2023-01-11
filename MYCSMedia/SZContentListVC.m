//
//  SZContentListVC.m
//  CMG_SDK_Example
//
//  Created by 马佳 on 2023/1/6.
//  Copyright © 2023 majia5499531@163.com. All rights reserved.
//

#import "SZContentListVC.h"
#import "SZManager.h"

@interface SZContentListVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * tableview;
    NSMutableArray * dataArr;
}
@end

@implementation SZContentListVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    //tableview
    CGFloat offsetY = 200;
    tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, offsetY, self.view.frame.size.width, self.view.frame.size.height-offsetY-offsetY) style:UITableViewStyleGrouped];
    tableview.dataSource=self;
    tableview.backgroundColor=[UIColor lightTextColor];
    tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    tableview.delegate=self;
    [self.view addSubview:tableview];
    
    //refresh
    UIButton * btn0 = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    btn0.backgroundColor=[UIColor brownColor];
    [btn0 setTitle:@"请求列表" forState:UIControlStateNormal];
    [btn0 addTarget:self action:@selector(requestBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn0];
    
    //loadmore
    UIButton * btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, 30)];
    btn1.backgroundColor=[UIColor brownColor];
    [btn1 setTitle:@"加载更多" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(requestMoreBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    //arr
    dataArr =[NSMutableArray array];
}





#pragma mark - Btn Action
//获取数据
-(void)requestBtnAction
{
    [dataArr removeAllObjects];
    __weak typeof (self) weakSelf = self;
    [SZManager requestContentList:3 Success:^(NSArray<SZContentModel *> * data) {
        [dataArr addObjectsFromArray:data];
        [weakSelf reloadTableview];
    } Error:^(NSString *msg) {
        
    } Fail:^(NSError *error) {
        
    }];
}

//获取更多数据
-(void)requestMoreBtnAction
{
    __weak typeof (self) weakSelf = self;
    [SZManager requestMoreContentList:3 LastContent:dataArr.lastObject Success:^(NSArray<SZContentModel *> *data) {
        [dataArr addObjectsFromArray:data];
        [weakSelf reloadTableview];
        } Error:^(NSString *msg) {
            
        } Fail:^(NSError *error) {
            
        }];
}




#pragma mark - Tableview delegate & datasource
-(void)reloadTableview
{
    [tableview reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid=@"testListCell";
    
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        
    }
    
    SZContentModel * model = dataArr[indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //使用路由方法，跳转详情
    SZContentModel * model = dataArr[indexPath.row];
    [SZManager routeToDetailPage:self.navigationController content:model];
}



@end
