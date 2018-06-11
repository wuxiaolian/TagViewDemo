//
//  JHTypeTagCell.m
//  Ganjiuhui
//
//  Created by Wuxiaolian on 16/12/6.
//  Copyright © 2016年 Wuxiaolian. All rights reserved.
//

#import "JHTypeTagCell.h"
#import "Masonry.h"
@implementation JHTypeTagCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubViews];
        
        self.nameLable.highlightedTextColor = [UIColor redColor];
        
    }
    return self;
}

- (void) loadSubViews{
    [self.contentView addSubview:self.nameLable];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.containerView];

    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
        make.height.equalTo(@0.5);
    }];

    UIView *bagView = [[UIView alloc]initWithFrame:self.frame];
    UIView *leftRedView = [[UIView alloc]initWithFrame:self.frame];
    leftRedView.backgroundColor = [UIColor redColor];
    [bagView addSubview:leftRedView];

    [leftRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.bottom.leading.equalTo(bagView);
        make.height.equalTo(@1);
    }];
    self.selectedBackgroundView = bagView;
    self.selectedBackgroundView.backgroundColor = [UIColor whiteColor];

}


#pragma mark - Custom Accessors

-(UILabel *)nameLable{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc] init];
        _nameLable.font = [UIFont systemFontOfSize:16];
        _nameLable.textColor = [UIColor blackColor];
    }
    return _nameLable;
}
-(UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.layer.borderWidth =1;
        _lineView.layer.borderColor = [UIColor grayColor].CGColor;
        
    }
    return _lineView;
}
-(UIView *)containerView{
    if (_containerView == nil) {
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor whiteColor];
    }
    return _containerView;
}
@end
