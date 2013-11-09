//
//  CommonQusitionViewController.m
//  钻石麻将
//
//  Created by 向 文品 on 13-11-8.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "CommonQusitionViewController.h"

@interface CommonQusitionViewController ()
{
    UITableView *dataTableView;
    NSMutableArray *dataArray;
    NSInteger currentSelectRow;
}
@end

@implementation CommonQusitionViewController

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
    //初始化数据
    currentSelectRow=-1;
    dataArray=[[NSMutableArray alloc] init];
    //设置灰色背景
	UIImageView *backImageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
    backImageView.image=[UIImage imageNamed:@"bg960.png"];
    [self.view addSubview:backImageView];
    //设置标题
    UIButton *titleLab=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [titleLab setTitle:@"常见问题          " forState:UIControlStateNormal];
    titleLab.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    [titleLab setTitleColor:[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1] forState:UIControlStateNormal];
    titleLab.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLab;
    //添加取消按钮
    UIImage *cancelImage=[UIImage imageNamed:@"bthome_collect"];
    UIButton *cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20*cancelImage.size.width/cancelImage.size.height, 20)];
    [cancelButton setBackgroundImage:cancelImage forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem=cancelItem;
    //添加列表数据
    dataTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height-64)];
    dataTableView.delegate=self;
    dataTableView.dataSource=self;
    dataTableView.backgroundColor=[UIColor clearColor];
    dataTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:dataTableView];
}

//列表数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Cell=@"Cell";
    CommonCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell==nil) {
        cell=[[CommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    CGRect frame=cell.bodyView.frame;
    if (indexPath.row==currentSelectRow) {
        frame.size.height=140;
        
    }else{
        frame.size.height=40;
    }
    cell.bodyView.frame=frame;
   cell.titleLab.text=@"麻将机需要经常修理么？";
    cell.detailInfoLab.text=@"答：不需要";
    CGSize size = CGSizeMake(284, 1000);
    
    CGSize msgSie = [cell.detailInfoLab.text sizeWithFont:cell.detailInfoLab.font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    frame=cell.detailInfoLab.frame;
    frame.size.height=msgSie.height;
    cell.detailInfoLab.frame=frame;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==currentSelectRow) {
        return 155;
    }
    return 55;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *indexPaths=[NSMutableArray arrayWithObjects:indexPath, nil];
    NSInteger lastSelectRow=currentSelectRow;
    currentSelectRow=indexPath.row;
    if (lastSelectRow==currentSelectRow) {
        currentSelectRow=-1;
        [dataTableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }else{
        if (lastSelectRow!=-1) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:lastSelectRow inSection:0]];
        }
        
        [dataTableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}
//返回按钮事件
-(void)cancelButtonClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
