//
//  XixiTableViewCell.h
//  NavigationControllerDemo
//
//  Created by 1 on 2017/6/7.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XixiTableViewCell : UITableViewCell

@property(nonatomic,strong)UIButton *selectButton;    //选择button
@property(nonatomic,copy)NSString *nameString;
@property(nonatomic,strong)NSArray *selectArray;      

@end
