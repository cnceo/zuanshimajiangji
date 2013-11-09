//
//  GoodsListViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "GoodsListViewController.h"

@interface GoodsListViewController ()
{
    NSMutableArray *dataArray;
    UITableView *dataTableView;
}
@end

@implementation GoodsListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIImageView *backImageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
    backImageView.image=[UIImage imageNamed:@"bg960.png"];
    [self.view addSubview:backImageView];
    //添加取消按钮
    UIImage *cancelImage=[UIImage imageNamed:@"back_login"];
    UIButton *cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20*cancelImage.size.width/cancelImage.size.height, 20)];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"back_login"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem=cancelItem;
    //设置标题
    NSArray *titles=@[@"新款特价",@"热销产品",@"精品木框",@"欧式唯美",@"经典红木"];
    UIButton *titleLab=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [titleLab setTitle:[NSString stringWithFormat:@"%@       ",[titles objectAtIndex:self.selectIndex]] forState:UIControlStateNormal];
    titleLab.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    [titleLab setTitleColor:[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1] forState:UIControlStateNormal];
    titleLab.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLab;
    //添加列表
	UIImage *tabImage=[UIImage imageNamed:@"view1_tabbar.png"];
    float screenHeight=[UIScreen mainScreen].bounds.size.height-20-44;
    float tabHeight=64*tabImage.size.height/tabImage.size.width;
    dataTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, screenHeight-tabHeight)];
    dataTableView.delegate=self;
    dataTableView.dataSource=self;
    dataTableView.backgroundColor=[UIColor clearColor];
    dataTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:dataTableView];
}
//返回事件
-(void)cancelButtonClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    //return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Cell=@"Cell";
    GoodsCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell==Nil) {
        cell=[[GoodsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
        UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 88, 320, 2)];
        sepImageView.image=[UIImage imageNamed:@"line_whitekuang"];
        [cell.contentView addSubview:sepImageView];
        
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.font=[UIFont fontWithName:@"ZhunYuan" size:17];
    cell.titleLab.text=@"路易十六";
    cell.detailInfoLab.text=@"全自动实木麻将桌 四口全自动麻将机 四口麻将桌，家用实用麻将自动马静，全自动实木麻将桌 四口全自动麻将机 四口麻将桌，家用实用麻将自动马静";
    cell.netMoneyLab.text=@"网购价：￥19800";
    cell.marketMoneyLab.text=@"市场价：￥9800";
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
