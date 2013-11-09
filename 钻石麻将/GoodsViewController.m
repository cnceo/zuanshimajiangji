//
//  GoodsViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-5.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "GoodsViewController.h"
#import "GoodsListViewController.h"
@interface GoodsViewController ()
{
    NSArray *dataArray;
    
}
@end

@implementation GoodsViewController

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
    //设置标题
    UIButton *titleLab=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [titleLab setTitle:@"产品分类" forState:UIControlStateNormal];
    titleLab.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    [titleLab setTitleColor:[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1] forState:UIControlStateNormal];
    titleLab.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLab;
    //添加列表
	UIImage *tabImage=[UIImage imageNamed:@"view1_tabbar.png"];
    float screenHeight=[UIScreen mainScreen].bounds.size.height-20-44;
    float tabHeight=64*tabImage.size.height/tabImage.size.width;
    UITableView *dataTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, screenHeight-tabHeight)];
    dataTableView.delegate=self;
    dataTableView.dataSource=self;
    dataTableView.backgroundColor=[UIColor clearColor];
    dataTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:dataTableView];
    //数据源
    dataArray=[[NSArray alloc] initWithObjects:@"新款特价",@"热销产品",@"精品木框",@"欧式唯美",@"经典红木", nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Cell=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell==Nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
        UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 48, 320, 2)];
        sepImageView.image=[UIImage imageNamed:@"line_whitekuang"];
        [cell.contentView addSubview:sepImageView];
        
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.font=[UIFont fontWithName:@"ZhunYuan" size:17];
    cell.textLabel.text=[dataArray objectAtIndex:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsListViewController *goodListVC=[[GoodsListViewController alloc] init];
    [self.navigationController pushViewController:goodListVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
