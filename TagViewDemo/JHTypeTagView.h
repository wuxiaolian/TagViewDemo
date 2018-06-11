//
//  JHTypeTagView.h
//  Ganjiuhui
//
//  Created by Wuxiaolian on 16/12/6.
//  Copyright © 2016年 Wuxiaolian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JHTypeTagView;
@protocol JHTypeTagViewDelegate <NSObject>
- (void)tagView:(JHTypeTagView *)typeView didSelectedIndexName:(NSString *)name WithIndex:(NSInteger)index;
@end

@interface JHTypeTagView : UICollectionView
<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *countArry;
@property (nonatomic, assign) CGFloat wid;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) NSInteger selectedIndex;


@property (weak, nonatomic) id<JHTypeTagViewDelegate> typeDelegate;

+ (instancetype)create;

-(void)setcontentWithDataArry:(NSArray *)dataArry WithWidth:(CGFloat)wid WithHeight:(CGFloat)height;
@end
