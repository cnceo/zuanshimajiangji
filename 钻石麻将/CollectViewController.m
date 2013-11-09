//
//  CollectViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-6.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "CollectViewController.h"
#import "myDefine.h"
@interface CollectViewController ()
{
    UIView *titleBarView;
    UITableView *dataTableView;
    NSMutableArray *dataGoodsArray;
    NSMutableArray *dataShopArray;
    int selectType;
    UIImageView *selecTypeImageView;
    UIButton *lastButton;
}
@end

@implementation CollectViewController

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
    UIImage *cancelImage=[UIImage imageNamed:@"bthome_collect"];
    UIButton *cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30*cancelImage.size.width/cancelImage.size.height,30)];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"bthome_collect"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem=cancelItem;
    //设置标题
    UIButton *titleLab=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    [titleLab setTitle:@"我的收藏       " forState:UIControlStateNormal];
    titleLab.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:20];
    [titleLab setTitleColor:[UIColor colorWithRed:40/255.0 green:40/255.0 blue:40/255.0 alpha:1] forState:UIControlStateNormal];
    titleLab.backgroundColor=[UIColor clearColor];
    self.navigationItem.titleView=titleLab;
    //添加列表

    float screenHeight=[UIScreen mainScreen].bounds.size.height-20-44;

    dataTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, screenHeight)];
    dataTableView.delegate=self;
    dataTableView.dataSource=self;
    dataTableView.backgroundColor=[UIColor clearColor];
    dataTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:dataTableView];
    [self setTitleBarView];
}
//设置标题栏
-(void)setTitleBarView
{
    titleBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 55)];
    titleBarView.backgroundColor=[UIColor whiteColor];
    UIImageView *bgImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 55)];
    bgImageView.image=[UIImage imageNamed:@"changebg_collect"];
    [titleBarView addSubview:bgImageView];
    //添加按钮
    NSArray *titles=@[@"收藏商品",@"收藏商户"];
    for (int i=0; i<titles.count; i++) {
        UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(25+170*i, 0, 100, 55)];
        button.tag=i;
        [button setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:TEXTBLUECOLOR forState:UIControlStateSelected];
        [button addTarget:self action:@selector(tableTypeChange:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:17];
        [titleBarView addSubview:button];
        if (i==0) {
            button.selected=YES;
            lastButton=button;
        }
    }
    //添加选择条
    UIImage *selectImage=[UIImage imageNamed:@"buttonbg_collect"];
    UIButton *selectImageView=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20*selectImage.size.width/selectImage.size.height, 20)];
    [selectImageView setBackgroundImage:selectImage forState:UIControlStateNormal];
    selectImageView.tag=3;
    [selectImageView addTarget:self action:@selector(tableTypeChange:) forControlEvents:UIControlEventTouchUpInside];
    selectImageView.center=CGPointMake(160, 25);
    [titleBarView addSubview:selectImageView];
    //添加点
    for (int i=0; i<2; i++) {
        UIImageView *topImageView=[[UIImageView alloc] initWithFrame:CGRectMake(8+65*i, 7, 7, 7)];
        topImageView.image=[UIImage imageNamed:@"dian_collect"];
        [selectImageView addSubview:topImageView];
    }
    //添加选择标签
    selecTypeImageView=[[UIImageView alloc] initWithFrame:CGRectMake(-5, -5, 30, 30)];
    selecTypeImageView.image=[UIImage imageNamed:@"button_collect"];
    [selectImageView addSubview:selecTypeImageView];
}
//列表类型改变
-(void)tableTypeChange:(UIButton *)button
{
    if (button.tag==3) {
        CGRect frame=selecTypeImageView.frame;
        if (frame.origin.x==-5) {
            frame.origin.x=-5+70;
        }else{
            frame.origin.x=-5;
        }
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            selecTypeImageView.frame=frame;
        } completion:^(BOOL finished) {
            
            selectType=button.tag;
            [dataTableView reloadData];
            for (UIButton *v in titleBarView.subviews) {
                if (![[v class] isSubclassOfClass:[UIButton class]]) {
                    continue ;
                }
                if (selecTypeImageView.frame.origin.x==-5) {
                    if (v.tag==0) {
                        selectType=0;
                        v.selected=YES;
                        lastButton=v;
                    }else{
                        v.selected=NO;
                    }
                }else{
                    if (v.tag==1) {
                        selectType=1;
                        v.selected=YES;
                        lastButton=v;
                    }else{
                        v.selected=NO;
                    }
                }
            }
        }];
    }else{
        if (lastButton==button) {
            return;
        }
        CGRect frame=selecTypeImageView.frame;
        frame.origin.x=-5+70*button.tag;
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            selecTypeImageView.frame=frame;
        } completion:^(BOOL finished) {
            selectType=button.tag;
            [dataTableView reloadData];
            lastButton.selected=NO;
            button.selected=YES;
            lastButton=button;
        }];
    }
    
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (selectType==0) {
        NSString *Cell=@"goodsCell";
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
    }else{
        NSString *Cell=@"shopCell";
        ShopCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
        if (cell==Nil) {
            cell=[[ShopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
            UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 88, 320, 2)];
            sepImageView.image=[UIImage imageNamed:@"line_whitekuang"];
            [cell.contentView addSubview:sepImageView];
            
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor clearColor];
        cell.textLabel.font=[UIFont fontWithName:@"ZhunYuan" size:17];
        cell.titleLab.text=@"西安麻将机";
        cell.addressLab.text=@"全自动实木麻将桌 四口全自动麻将机 四口麻将桌，家用实用麻将自动马静，全自动实木麻将桌 ";
        cell.phoneNumLab.text=@"电话：028-327627863723";
        return cell;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return titleBarView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return titleBarView.frame.size.height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
//选取信息事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
