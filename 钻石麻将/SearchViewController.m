//
//  SearchViewController.m
//  钻石麻将
//
//  Created by demo on 13-11-7.
//  Copyright (c) 2013年 Junsheng. All rights reserved.
//

#import "SearchViewController.h"
#import "myDefine.h"
@interface SearchViewController ()
{
    NSInteger selectType;
    UITableView *dataTableView;
    NSMutableArray *dataArray;
    UITextField *searchTextField;
    NSMutableArray *searchWordArray;
    NSMutableArray *searchResultArray;
    BOOL isEdit;
}
@end

@implementation SearchViewController

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
    //初始化数组
    searchWordArray=[[NSMutableArray alloc] init];
    searchResultArray=[[NSMutableArray alloc] init];
	UIImageView *backImageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
    backImageView.image=[UIImage imageNamed:@"bg960.png"];
    [self.view addSubview:backImageView];
    //添加搜索框
    UIView *sView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    
    UIImage *searchBgImage=[UIImage imageNamed:@"seachbg_seach"];
    UIImageView *searchBgImageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 30*searchBgImage.size.width/searchBgImage.size.height, 30)];
    searchBgImageView.image=searchBgImage;
    [sView addSubview:searchBgImageView];
    //添加搜索按钮
    UIButton *searchButton=[[UIButton alloc] initWithFrame:CGRectMake(23, 5, 20, 20)];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"zoom_seach"] forState:UIControlStateNormal];
    [sView addSubview:searchButton];
    //添加输入框
    searchTextField=[[UITextField alloc] initWithFrame:CGRectMake(50, 0, 30*searchBgImage.size.width/searchBgImage.size.height-40, 30)];
    searchTextField.placeholder=@"钻石产品搜索";
    searchTextField.delegate=self;
    [searchTextField addTarget:self action:@selector(searchTextFieldDidEdit) forControlEvents:UIControlEventEditingDidEndOnExit];
    [searchTextField  addTarget:self action:@selector(searchTextFieldValueChange) forControlEvents:UIControlEventEditingChanged];
    searchTextField.textColor=TEXTGRAYCOLOR;
    [searchTextField setReturnKeyType:UIReturnKeySearch];
    [searchTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [sView addSubview:searchTextField];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:sView];
    //取消按钮
    UIImage *cancelImage=[UIImage imageNamed:@"buttonbg_white"];
    UIButton *cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10+30*cancelImage.size.width/cancelImage.size.height, 30)];
    [cancelButton setBackgroundImage:cancelImage forState:UIControlStateNormal];
    [cancelButton setTitle:@" 取消" forState:UIControlStateNormal];
    cancelButton.titleLabel.font=[UIFont fontWithName:@"ZhunYuan" size:15];
    [cancelButton setTitleColor:TEXTBLUECOLOR forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *cancelItem=[[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.rightBarButtonItem=cancelItem;
    //添加列表
    dataTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height-64)];
    dataTableView.backgroundColor=[UIColor clearColor];
    dataTableView.delegate=self;
    dataTableView.dataSource=self;
    dataTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:dataTableView];
}
//搜索框输入发生变化时
-(void)searchTextFieldValueChange
{
    NSDictionary *array=[[NSUserDefaults standardUserDefaults] valueForKey:@"searchWords"];
    NSMutableArray *sArray=[NSMutableArray array];
    for (NSString *string in [array allKeys]) {
        NSRange rangeBase = [string rangeOfString:searchTextField.text];
        if (rangeBase.length>0) {
            [sArray addObject:string];
        }
    }
    if (![sArray isEqualToArray:searchWordArray]) {
        [searchWordArray removeAllObjects];
        for (NSString *str in sArray) {
            [searchWordArray addObject:str];
        }
        [dataTableView reloadData];
    }
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    selectType=0;
    isEdit=YES;
    [dataTableView reloadData];
}
-(void)searchTextFieldDidEdit
{
    isEdit=NO;
    if (searchTextField.text.length==0) {
        return;
    }
    selectType=1;
    NSMutableDictionary *array=[NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] valueForKey:@"searchWords"]];
    if (array==Nil) {
        array=[NSMutableDictionary dictionary];
    }
    [array setValue:searchTextField.text forKey:searchTextField.text];
    [[NSUserDefaults standardUserDefaults] setValue:array forKey:@"searchWords"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [dataTableView reloadData];
}
-(void)cancelButtonClick
{
    if (!isEdit) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    searchTextField.text=nil;
    [searchTextField resignFirstResponder];
    if (searchResultArray.count!=0) {
        selectType=1;
        [dataTableView reloadData];
    }
}
//列表数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (selectType==0) {
        return searchWordArray.count;
    }
    return 10;
    //return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (selectType==0) {
        NSString *Cell=@"Cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
        if (cell==Nil) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            UIImageView *sepImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 43, 320, 2)];
            sepImageView.image=[UIImage imageNamed:@"line_whitekuang"];
            [cell.contentView addSubview:sepImageView];
            cell.textLabel.font=[UIFont fontWithName:@"ZhunYuan" size:16];
            cell.textLabel.textColor=TEXTGRAYCOLOR;
        }
        cell.textLabel.text=[searchWordArray objectAtIndex:indexPath.row];
        return cell;
    }else{
        NSString *Cell=@"GoodsCell";
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
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (selectType==0) {
        searchTextField.text=[searchWordArray objectAtIndex:indexPath.row];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (selectType==0) {
        return 45;
    }
    return 90;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
