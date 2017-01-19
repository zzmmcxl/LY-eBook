//
//  BookShelfHeaderView.m
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/9.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "BookShelfHeaderView.h"
#import "SDCycleScrollView.h"
#import "SegmentTitleView.h"


@interface BookShelfHeaderView()

@property (nonatomic,strong) SDCycleScrollView *adScrollView;
@property (nonatomic,strong) SegmentTitleView *segmentView;

@end

static CGFloat segmentHeight = 50;

@implementation BookShelfHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //广告轮播
        const CGFloat width = SCREEN_WIDTH;
        const CGFloat height = self.height - segmentHeight;
        const CGFloat originX = 0;
        const CGFloat originY = 0;
        CGRect frame = CGRectMake(originX, originY, width, height);
        
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        self.adScrollView = cycleScrollView2;
        
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        cycleScrollView2.backgroundColor = BlackColor;
        
        [self addSubview:cycleScrollView2];
        
        
        //图书分类
        _segmentView = [[SegmentTitleView alloc]initWithFrame:CGRectMake(0, cycleScrollView2.height, SCREEN_WIDTH, segmentHeight) titleArr:@[@"我的图书",@"订阅报纸",@"关注杂志"]];
        [self addSubview:_segmentView];
        
        
    }
    return self;
}


- (void)setAdImages:(NSArray *)adImages
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _adScrollView.imageURLStringsGroup = adImages;
    });
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
