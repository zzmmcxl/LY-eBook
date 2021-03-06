//
//  BookStoreCollectionCell.m
//  仿搜狗阅读
//
//  Created by Rich on 2017/1/12.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import "BookStoreCollectionCell.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"


@interface BookStoreCollectionCell()

@property (nonatomic,strong) UIImageView *coverImV;


@end



@implementation BookStoreCollectionCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //self.backgroundColor = GREEN_COLOR;
        self.layer.borderWidth = 2;
        self.layer.borderColor = WHITE_COLOR.CGColor;
        
        _coverImV = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_coverImV];
        
    }
    return self;
}

- (void)setBookStoreModel:(BookStoreModel*)model
{
//    [_coverImV sd_setImageWithURL:[NSURL URLWithString:model.TheMagazine.Cover] placeholderImage:nil];
    [_coverImV sd_setImageWithURL:[NSURL URLWithString:model.Cover] placeholderImage:nil];
}




@end
