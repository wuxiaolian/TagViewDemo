//
//  JHCircleView.h
//  TagViewDemo
//
//  Created by Wuxiaolian on 2018/6/7.
//  Copyright © 2018年 Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHCircleView;
@protocol JHCircleViewDelegate <NSObject>
- (void)circleView:(JHCircleView *)circleView didSelectedIndex:(NSInteger)index;
@end
@interface JHCircleView : UIView
<UIScrollViewDelegate>
@property (nonatomic, strong) UIView *CircleView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *contentView;

@property (weak, nonatomic) id<JHCircleViewDelegate> circleDelegate;

/**
 *  传入数据
 */
- (void)setContentWithDataList:(NSArray *)dataList;
@end
