//
//  JHCircleView.m
//  TagViewDemo
//
//  Created by Wuxiaolian on 2018/6/7.
//  Copyright © 2018年 Wu. All rights reserved.
//

#import "JHCircleView.h"
#import "Masonry.h"
#import "JHContainerView.h"

#define kScreenWidth            CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight           CGRectGetHeight([UIScreen mainScreen].bounds)

@implementation JHCircleView
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

-(void)setContentWithDataList:(NSArray *)dataList{
    for (int i=0; i<dataList.count; i++) {
        JHContainerView *view = [[JHContainerView alloc] init];
        view.myLable.text = dataList[i];
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.width.equalTo(self.scrollView);
            make.leading.equalTo(@(kScreenWidth*i));
        }];
        if (i== dataList.count-1) {
            [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.trailing.equalTo(view.mas_trailing);
            }];
        }
        
    }
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index =scrollView.contentOffset.x/kScreenWidth;
    if ([self.circleDelegate respondsToSelector:@selector(circleView:didSelectedIndex:)]) {
        [self.circleDelegate circleView:self didSelectedIndex:index];
    }
}
#pragma mark - loadSubViews
- (void)loadSubViews{
    [self addSubview:self.CircleView];
    [self.CircleView addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    
    [self.CircleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.CircleView);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
}
#pragma mark - Custom Accessors
-(UIView *)CircleView{
    if (_CircleView == nil) {
        _CircleView = [[UIView alloc] init];
    }
    return _CircleView;
}
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}
- (UIView *)contentView {
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
    }
    return _contentView;
}
@end
