//
//  BaseViewController.m
//  NavigationControllerDemo
//
//  Created by 1 on 2017/6/6.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic,strong)UINavigationBar * NavigationBar;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController.interactivePopGestureRecognizer setValue:@([UIScreen mainScreen].bounds.size.width) forKeyPath:@"_recognizer._settings._edgeSettings._edgeRegionSize"];
    if (!self.NavigationBar) {
        self.NavigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,64)];
        [self.view addSubview:self.NavigationBar];
        self.ZJNavigationItem = [[UINavigationItem alloc]initWithTitle:@"hellows"];
        [self.NavigationBar pushNavigationItem:self.ZJNavigationItem animated:YES];
        UIBarButtonItem * logeItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(logeClick)];
        NSArray * arr = @[logeItem];
        self.ZJNavigationItem.rightBarButtonItems = arr;
        if ([self.navigationController.childViewControllers count]>1) {
            
            UIBarButtonItem * backItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backclick)];
            NSArray * arrleft = @[backItem];
            self.ZJNavigationItem.leftBarButtonItems = arrleft;
        }
    }
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    self.navigationController.interactivePopGestureRecognizer.delegate =self;
}
-(void)logeClick{
    
    
}
-(void)backclick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
