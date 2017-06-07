//
//  XixiTableViewCell.m
//  NavigationControllerDemo
//
//  Created by 1 on 2017/6/7.
//  Copyright © 2017年 Lengchunyu. All rights reserved.
//

#import "XixiTableViewCell.h"
#import <YYWebImage/YYWebImage.h>
#import <YYCategories/NSString+YYAdd.h>
#import <YYCategories/UIView+YYAdd.h>
@interface XixiTableViewCell ()
@property(nonatomic,strong)UILabel *nameLabel;
@end
@implementation XixiTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectButton =[[UIButton alloc]init];
        self.selectButton.layer.cornerRadius =10;
        self.selectButton.clipsToBounds =YES;
        self.selectButton.userInteractionEnabled =NO;
        self.selectButton.hidden =YES;
        [self.selectButton setBackgroundImage:[UIImage yy_imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
        [self addSubview:self.selectButton];
        
        self.nameLabel =[[UILabel alloc]init];
        self.nameLabel.textColor =[UIColor blueColor];
        self.nameLabel.textAlignment =NSTextAlignmentLeft;
        [self addSubview:self.nameLabel];
    
    }

    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];

    self.selectButton.frame =CGRectMake(self.width-30,10,20,20);
    self.nameLabel.frame =CGRectMake(0,0,self.width-30,self.height);
    
}
-(void)setNameString:(NSString *)nameString{
    _nameString =nameString;
    self.nameLabel.text =nameString;
    
}

-(void)setSelectArray:(NSArray *)selectArray{
    _selectArray =selectArray;
    if ([selectArray containsObject:self.nameString]) {
        
        self.selectButton.hidden =NO;
    }else{
        
        self.selectButton.hidden =YES;
    }
    
    
}





@end
