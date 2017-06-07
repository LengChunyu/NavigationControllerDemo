//
//  RootTableViewCell.m
//  NavigationControllerDemo
//
//  Created by 1 on 2017/6/6.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import "RootTableViewCell.h"
#import <YYCategories/NSString+YYAdd.h>
#import <YYCategories/UIView+YYAdd.h>
@interface RootTableViewCell()

@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIView *backView;

@end
@implementation RootTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.nameLabel =[[UILabel alloc]init];
        self.nameLabel.textColor =[UIColor redColor];
        self.nameLabel.text =@"个性标签";
        [self addSubview:self.nameLabel];
        
        
    }
    
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.nameLabel.frame =CGRectMake(0, 0,self.width, 30);
    CGFloat buttonLeft=0;
    CGFloat buttonBottom =0;
    self.backView.frame =CGRectMake(0, self.nameLabel.bottom,self.width,self.height-self.nameLabel.height);
    for (int i=0;i<self.dataArray.count; i++) {
        
        UIButton *button =[self.backView viewWithTag:100+i];
        CGSize buttonSize =[self.dataArray[i] sizeForFont:[UIFont systemFontOfSize:17] size:CGSizeMake(CGFLOAT_MAX, 30) mode:NSLineBreakByWordWrapping];
        button.frame =CGRectMake(buttonLeft,buttonBottom,buttonSize.width, 30);
        
        if (button.right>self.width) {
            
            buttonLeft =0;
            
            buttonBottom =buttonBottom+30;
            
            button.frame =CGRectMake(buttonLeft,buttonBottom,buttonSize.width,30);
            
        }
        
        buttonLeft=buttonLeft+buttonSize.width+5;
    }

}
-(void)setDataArray:(NSArray *)dataArray{
    
    _dataArray =dataArray;
    //清除相应的button
    [self.backView removeFromSuperview];
    
    if (_dataArray!=nil) {
        //创建button
        self.backView =[[UIView alloc]init];
        UITapGestureRecognizer *oneTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneTap:)];
        [oneTap setNumberOfTapsRequired:1];
        [self.backView addGestureRecognizer:oneTap];
        [self addSubview:self.backView];
        
        for (int i=0;i<dataArray.count; i++) {
            UIButton *button =[[UIButton alloc]init];
            button.titleLabel.font =[UIFont systemFontOfSize:16];
            button.backgroundColor =[UIColor grayColor];
            button.tag =100+i;
            button.hidden =YES;
            [button addTarget:self action:@selector(buttonSelectMethod:) forControlEvents:UIControlEventTouchUpInside];
            button.layer.borderWidth =1;
            button.layer.borderColor =[UIColor redColor].CGColor;
            button.layer.cornerRadius =10;
            button.clipsToBounds =YES;
            [self.backView addSubview:button];
        }
        for (int i=0;i<dataArray.count;i++) {
            UIButton *button =[self.backView viewWithTag:100+i];
            button.hidden =NO;
            [button setTitle:dataArray[i] forState:UIControlStateNormal];
            
        }
        for (int i=(int)dataArray.count;i<21; i++) {
            UIButton *button =[self.backView viewWithTag:100+i];
            button.hidden =YES;
        }
    }

}
-(void)buttonSelectMethod:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(buttonAddtargetMethod:buttonTag:)]) {
        [self.delegate buttonAddtargetMethod:self.indexPath buttonTag:button.tag-100];
    }
    
}
#pragma mark-设置cell的高度
+(CGFloat)backHeight:(NSArray *)array{
    
    CGFloat buttonLeft=0;
    CGFloat buttonBottom =30;
    
    for (int i=0;i<array.count; i++) {
        
        
        CGSize buttonSize =[array[i] sizeForFont:[UIFont systemFontOfSize:17] size:CGSizeMake(CGFLOAT_MAX, 30) mode:NSLineBreakByWordWrapping];
        

        if (buttonLeft>[UIScreen mainScreen].bounds.size.width) {
            
            buttonLeft =0;
            
            buttonBottom =buttonBottom+30;
        }
        
        buttonLeft=buttonLeft+buttonSize.width+5;
    }
    
    return buttonBottom+60;

}
-(void)oneTap:(UITapGestureRecognizer *)tap{
    
    
    
    
    
}
@end
