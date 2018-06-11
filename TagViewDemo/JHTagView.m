//
//  JHTagView.m
//  TagViewDemo
//
//  Created by Wuxiaolian on 2018/6/7.
//  Copyright © 2018年 Wu. All rights reserved.
//

#import "JHTagView.h"
#import "Masonry.h"

#define kScreenWidth            CGRectGetWidth([UIScreen mainScreen].bounds)
@interface JHTagView ()<JHCircleViewDelegate>
{

    NSInteger _index;
}
@end
@implementation JHTagView

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
#pragma mark - JHTypeTagViewDelegate
-(void)tagView:(JHTypeTagView *)typeView didSelectedIndexName:(NSString *)name WithIndex:(NSInteger)index{
    if (_index == index) {
        return;
    }
    _index = index;
   
    [self.circleView.scrollView setContentOffset:CGPointMake(kScreenWidth*index,0)];
}
#pragma mark - JHCircleViewDelegate
-(void)circleView:(JHCircleView *)circleView didSelectedIndex:(NSInteger)index{
    self.typeView.selectedIndex = index;
}
#pragma mark - loadSubViews
- (void)loadSubViews{
    [self addSubview:self.typeView];
    [self addSubview:self.circleView];
    [self setUpSubViews];
}
- (void)setUpSubViews{
    [self.typeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.top.equalTo(self);
        make.height.equalTo(@35);
;
    }];
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeView.mas_bottom);
        make.leading.trailing.bottom.equalTo(self);
    }];
}
#pragma mark - Custom Accessors
-(JHTypeTagView *)typeView{
    if (_typeView == nil) {
        _typeView = [JHTypeTagView create];
        _typeView.typeDelegate = self;
        _typeView.scrollEnabled = YES;
        _typeView.showsVerticalScrollIndicator = NO;
        _typeView.showsHorizontalScrollIndicator = NO;
    }
    return _typeView;
}
-(JHCircleView *)circleView{
    if (_circleView == nil) {
        _circleView = [[JHCircleView alloc] init];
        _circleView.circleDelegate = self;
    }
    return _circleView;
}
@end
