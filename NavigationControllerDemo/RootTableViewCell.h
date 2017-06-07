//
//  RootTableViewCell.h
//  NavigationControllerDemo
//
//  Created by 1 on 2017/6/6.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtonTargetDelegate <NSObject>
-(void)buttonAddtargetMethod:(NSIndexPath *)indexpath buttonTag:(NSInteger)tag;
@end
@interface RootTableViewCell : UITableViewCell

@property(nonatomic,assign)id<ButtonTargetDelegate> delegate;     
@property(nonatomic,strong)NSArray *dataArray;    
@property(nonatomic,strong)NSIndexPath *indexPath;   
+(CGFloat)backHeight:(NSArray *)array;
@end
