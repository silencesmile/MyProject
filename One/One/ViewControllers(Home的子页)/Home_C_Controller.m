//
//  Home_C_Controller.m
//  One
//
//  Created by youngstar on 16/5/19.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "Home_C_Controller.h"
#import "Home_C_TableViewCell.h"

@interface Home_C_Controller ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) UITableView * listTableView;
@property (nonatomic , strong) NSMutableArray * imageArray;
@end

@implementation Home_C_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBackArrow];
    self.title = @"多图下载";
    
    self.listTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    _listTableView.backgroundColor = [UIColor whiteColor];
    
    _listTableView.tableFooterView = [[UIView alloc]init]; // 隐藏没有使用的cell的分割线
//    _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone; // 隐藏所有cell的分割线
     [_listTableView setSeparatorColor:[UIColor redColor]]; // 设置分割线的颜色
    
    [self.view addSubview:_listTableView];
    
    [_listTableView registerNib:[UINib nibWithNibName:@"Home_C_TableViewCell" bundle:nil] forCellReuseIdentifier:@"Home_C_Cell"];
    
}


#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Home_C_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Home_C_Cell"];
    if (!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Home_C_Cell"];
    }
    
    return cell;
}


// 最后这里两个方法是讲cell的显示补充完整
-(void)viewDidLayoutSubviews {
    if ([_listTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_listTableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([_listTableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [_listTableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }  
}


@end
