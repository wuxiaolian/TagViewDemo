//
//  JHContainerView.m
//  TagViewDemo
//
//  Created by Wuxiaolian on 2018/6/7.
//  Copyright © 2018年 Wu. All rights reserved.
//

#import "JHContainerView.h"
#import "Masonry.h"

@implementation JHContainerView
-(void)awakeFromNib{
    [super awakeFromNib];
    [self loadSubViews];
    
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self loadSubViews];
    }
    return self;
}
-(void)loadSubViews{
    UILabel *lable = [[UILabel alloc] init];
    lable.font = [UIFont systemFontOfSize:30];
    lable.textColor = [UIColor redColor];
    [self addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    self.myLable = lable;
}

@end
