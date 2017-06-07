//
//  RootViewController.m
//  NavigationControllerDemo
//
//  Created by Lengchunyu on 2017/6/5.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import "RootViewController.h"
#import "XixiViewController.h"
#import "BaseNavViewController.h"
#import "RootTableViewCell.h"
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource,ButtonTargetDelegate>

@property(nonatomic,strong)UITableView *myTableView;
@property(nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation RootViewController
#pragma mark-懒加载
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray =[[NSMutableArray alloc]init];
    }
    
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor grayColor];

//    //添加手势
//    UISwipeGestureRecognizer *swipeCestureR =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swichGr:)];
//    swipeCestureR.direction =UISwipeGestureRecognizerDirectionUp;
//    [self.view addGestureRecognizer:swipeCestureR];
    
    //创建视图
    [self creatSubViews];
}
-(void)viewWillAppear:(BOOL)animated{

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//#pragma mark-向上滑动手势
//-(void)swichGr:(UISwipeGestureRecognizer *)swipeGeture{
//    
//    CATransition* transition = [CATransition animation];
//    transition.duration =2;
//    transition.type =kCATransitionPush;
//    transition.subtype=kCATransitionFromTop;
//    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    XixiViewController *xixix =[[XixiViewController alloc]init];
//    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
//    
//    [self.navigationController pushViewController:xixix animated:NO];
//    
//    
//}
#pragma mark-创建视图
-(void)creatSubViews{
    
    self.myTableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.myTableView.delegate =self;
    self.myTableView.dataSource =self;
    [self.view addSubview:self.myTableView];
    [self.myTableView registerClass:[RootTableViewCell class] forCellReuseIdentifier:@"RootTableViewCell"];

}
#pragma mark-============================tableviewDelegate================================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RootTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"RootTableViewCell"];
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    cell.delegate =self;
    cell.indexPath =indexPath;
    
    if (indexPath.row==19) {
        cell.dataArray =self.dataArray;
    }else{
        
        cell.dataArray =nil;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath.row==19) {
       return [RootTableViewCell backHeight:self.dataArray];
    }
    return 100;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CATransition* transition = [CATransition animation];
    transition.duration =0.6;
    transition.type =kCATransitionPush;
    transition.subtype=kCATransitionFromTop;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    XixiViewController *xixix =[[XixiViewController alloc]init];
    xixix.pushSelectArray =self.dataArray;
    __weak typeof(self) weakSelf =self;
    xixix.ReloadTableViewBlock =^(NSArray *dataArray){
        [weakSelf.dataArray removeAllObjects];
        [weakSelf.dataArray addObjectsFromArray:dataArray];
        [weakSelf.myTableView reloadData];
        
    };
    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    [self.navigationController pushViewController:xixix animated:NO];
    
    
}
#pragma mark-点击button的代理方法
-(void)buttonAddtargetMethod:(NSIndexPath *)indexpath buttonTag:(NSInteger)tag{
    
    [self.dataArray removeObjectAtIndex:tag];
    [self.myTableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
    
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
