//
//  XixiViewController.m
//  NavigationControllerDemo
//
//  Created by Lengchunyu on 2017/6/5.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import "XixiViewController.h"
#import "XixiTableViewCell.h"
@interface XixiViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)NSMutableArray *dataArray;      //数据
@property(nonatomic,strong)NSMutableArray *selectDataArray;

@end

@implementation XixiViewController
#pragma mark-懒加载
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray =[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
-(NSMutableArray *)selectDataArray{
    if (!_selectDataArray) {
        _selectDataArray =[[NSMutableArray alloc]init];
    }
    return _selectDataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor grayColor];
    [self creatData];
    [self creatSubViews];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    UIBarButtonItem * logeItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveClick:)];
    NSArray * arr = @[logeItem];
    self.ZJNavigationItem.rightBarButtonItems = arr;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
#pragma mark-创建数据
-(void)creatData{
    NSArray *array =@[@"宅",@"萌萌哒",@"叫我逗比",@"单板狂人",@"靠谱",@"喜欢简单",@"极限运动",@"随性",@"极品吃货",@"双板大师",@"女汉子",@"敢爱敢恨",@"装备控",@"星座研究达人",@"专业毒舌",@"摇滚青年",@"电影发烧友",@"自拍狂人",@"文艺范儿",@"时尚先锋",@"宠物控",@"游戏爱好者"];
    [self.selectDataArray addObjectsFromArray:self.pushSelectArray];
    [self.dataArray addObjectsFromArray:array];
    
}
#pragma mark-创建视图
-(void)creatSubViews{
    
    UIButton *rightButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightButton setTitle:@"保存" forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    self.myTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64,self.view.bounds.size.width,self.view.bounds.size.height-64) style:UITableViewStylePlain];
    self.myTableView.delegate =self;
    self.myTableView.dataSource =self;
    [self.view addSubview:self.myTableView];
    [self.myTableView registerClass:[XixiTableViewCell class] forCellReuseIdentifier:@"XixiTableViewCell"];
    
}
#pragma mark-点击保存按钮
-(void)saveClick:(UIButton *)button{
    
    if (self.ReloadTableViewBlock) {
        self.ReloadTableViewBlock(self.selectDataArray);
    }

    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark-=======================tableViewDelegate==================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XixiTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"XixiTableViewCell"];
    cell.nameString =self.dataArray[indexPath.row];
    cell.selectArray =self.selectDataArray;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XixiTableViewCell *cell =(XixiTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (cell.selectButton.hidden) {
        [self.selectDataArray addObject:[self.dataArray objectAtIndex:indexPath.row]];
        
    }else{
        [self.selectDataArray removeObject:[self.dataArray objectAtIndex:indexPath.row]];
        
    }
    [tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
