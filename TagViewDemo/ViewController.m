//
//  ViewController.m
//  TagViewDemo
//
//  Created by Wuxiaolian on 2018/6/7.
//  Copyright © 2018年 Wu. All rights reserved.
//

#import "ViewController.h"
#import "JHTagView.h"
#import "Masonry.h"

#define kScreenWidth            CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight           CGRectGetHeight([UIScreen mainScreen].bounds)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JHTagView *tag = [[JHTagView alloc] init];
    NSArray *arry =@[@"1",@"2",@"3"];
    [tag.typeView setcontentWithDataArry:arry WithWidth:kScreenWidth/3 WithHeight:35];
    [tag.circleView setContentWithDataList:arry];
    [self.view addSubview:tag];
    [tag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@44);
        make.bottom.leading.trailing.equalTo(self.view);
    }];  
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
