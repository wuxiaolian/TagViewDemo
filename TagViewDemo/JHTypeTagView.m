//
//  JHTypeTagView.m
//  Ganjiuhui
//
//  Created by Wuxiaolian on 16/12/6.
//  Copyright © 2016年 Wuxiaolian. All rights reserved.
//

#import "JHTypeTagView.h"
#import "JHTypeTagCell.h"
static NSString *reauseIdentifier = @"reauseIdentifier";

@implementation JHTypeTagView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerClass:[JHTypeTagCell class] forCellWithReuseIdentifier:reauseIdentifier];
    }
    return self;
}

#pragma mark - Public

+ (instancetype)create {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    JHTypeTagView *collectionView = [[JHTypeTagView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = collectionView;
    collectionView.delegate = collectionView;
    collectionView.scrollEnabled = NO;
    
    return collectionView;
}

// 添加数据
-(void)setcontentWithDataArry:(NSArray *)dataArry WithWidth:(CGFloat)wid WithHeight:(CGFloat)height{
    if (self.wid == wid) {
        return;
    }
    self.countArry = dataArry;
    self.wid = wid;
    self.height = height;
    [self reloadData];
}
#pragma mark - UICollectionViewDataSource && UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.countArry.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JHTypeTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reauseIdentifier forIndexPath:indexPath];
    cell.nameLable.text = self.countArry[indexPath.row];

    if (self.selectedIndex == 0 &&indexPath.item == 0 && indexPath.section == 0) {
        cell.selected = YES;
        [self selectItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.row inSection:indexPath.section] animated:YES scrollPosition:UICollectionViewScrollPositionNone];//设置选中第一行（默认有蓝色背景）
        [self collectionView:self didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];//实现点击第一行所调用的方法

    }else{
        if (indexPath.item == self.selectedIndex && indexPath.section == 0) {
            cell.selected = YES;
            [self selectItemAtIndexPath:[NSIndexPath indexPathForItem:indexPath.row inSection:indexPath.section] animated:YES scrollPosition:UICollectionViewScrollPositionNone];//设置选中第一行（默认有蓝色背景）
            [self collectionView:self didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:self.selectedIndex inSection:0]];//实现点击第一行所调用的方法
        }
 
    }
    return cell;
}
//cell 大小

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.wid, self.height);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedIndex != indexPath.row) {
        self.selectedIndex = indexPath.row;
        
    }
    if ([self.typeDelegate respondsToSelector:@selector(tagView:didSelectedIndexName:WithIndex:)]) {
        [self.typeDelegate tagView:self didSelectedIndexName:self.countArry[indexPath.item] WithIndex:indexPath.item];
    }
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    [self reloadData];
}
@end
