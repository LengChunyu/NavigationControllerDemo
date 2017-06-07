//
//  XixiViewController.h
//  NavigationControllerDemo
//
//  Created by Lengchunyu on 2017/6/5.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import "BaseViewController.h"

@interface XixiViewController : BaseViewController

@property(nonatomic,strong)NSArray *pushSelectArray;    
@property(nonatomic,copy)void(^ReloadTableViewBlock)(NSArray *dataArray);
@end
