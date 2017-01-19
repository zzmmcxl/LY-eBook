//
//  SegmentTitleView.m
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/10.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "SegmentTitleView.h"

@interface SegmentTitleView()

@property (nonatomic,strong) NSMutableArray *btnArr;
@property (nonatomic,strong) NSArray *titleArr;

@end


@implementation SegmentTitleView

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray*)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = ORANGE_COLOR;
        
        _btnArr = [NSMutableArray array];
        _titleArr = titleArr;
        
        CGFloat btnWidth = SCREEN_WIDTH/titleArr.count;
        CGFloat btnHeight = self.height - 2;
        
        for (int i = 0; i < titleArr.count; i ++) {
            
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnWidth*i, 0, btnWidth, btnHeight)];
            [btn addTarget:self action:@selector(selectTitle:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 100 + i;
            [btn setTitle:titleArr[i] forState:UIControlStateNormal];
            [btn setBackgroundColor:WHITE_COLOR];
            [self addSubview:btn];
            
            [_btnArr addObject:btn];
        }
        
        [self chooseOneBtn:_btnArr[0]];
        
        
    }
    return self;
}

- (void)selectTitle:(UIButton*)sender
{
    [self chooseOneBtn:sender];
    
    if (_selectTitle) {
        _selectTitle(sender.tag - 100);
    }
}

- (void)chooseOneBtn:(UIButton*)sender
{
    for (UIButton *btn in _btnArr) {
        [btn setBackgroundColor:WHITE_COLOR];
        [btn setTitleColor:BlackColor forState:UIControlStateNormal];
    }
    
    [sender setBackgroundColor:CLEAR_COLOR];
    [sender setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
