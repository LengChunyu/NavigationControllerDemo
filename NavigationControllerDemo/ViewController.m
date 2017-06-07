//
//  ViewController.m
//  NavigationControllerDemo
//
//  Created by Lengchunyu on 2017/6/5.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import "ViewController.h"
#import "XixiViewController.h"
#import <AFNetworking/AFNetworking.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor redColor];
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:[[XixiViewController alloc]init]];
    
    [self presentViewController:nav animated:YES completion:nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
