//
//  JHTagView.h
//  TagViewDemo
//
//  Created by Wuxiaolian on 2018/6/7.
//  Copyright © 2018年 Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHTypeTagView.h"
#import "JHCircleView.h"
@interface JHTagView : UIView<JHTypeTagViewDelegate>

@property (nonatomic, strong)JHTypeTagView *typeView;
@property (nonatomic, strong)JHCircleView *circleView;

@end
