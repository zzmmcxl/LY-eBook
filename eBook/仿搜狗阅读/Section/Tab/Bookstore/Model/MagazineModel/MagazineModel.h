//
//  MagazineModel.h
//  仿搜狗阅读
//
//  Created by DemoLi on 2017/1/18.
//  Copyright © 2017年 YinTokey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MagazineTypeModel.h"

@interface MagazineModel : NSObject

@property (nonatomic,strong) NSString *Abbreviation;
@property (nonatomic,strong) NSString *Cover;
@property (nonatomic,strong) NSString *Date;
@property (nonatomic,strong) NSString *Description;
@property (nonatomic,strong) NSString *Edition;
@property (nonatomic,assign) NSInteger Id;
@property (nonatomic,assign) NSInteger IsRecommend;
@property (nonatomic,strong) NSString *Period;
@property (nonatomic,strong) NSString *Press;
@property (nonatomic,assign) NSInteger Price;
@property (nonatomic,strong) NSString *Tag;
@property (nonatomic,strong) MagazineTypeModel *Types;


//                TheMagazine =                 {
//                    Abbreviation = ZYJYYJ;
//                    Cover = "http://pic.dooland.com/Magazine/2016/11/21/39572262125407/302832262126641.jpg@450h_450w_0e";
//                    Date = "2016/11/1 0:00:00";
//                    Description = "";
//                    Edition = "16\U5e7411\U6708\U53f7";
//                    Id = 8228;
//                    IsRecommend = 0;
//                    Name = "\U804c\U4e1a\U6559\U80b2\U7814\U7a76";
//                    Period = "";
//                    Press = "";
//                    Price = 6;
//                    Tag = "";
//                    Types =                     {
//                        MagazineType =                         {
//                            TypeID = 4;
//                            TypeName = "\U6559\U80b2\U79d1\U6280";
//                        };
//                    };

@end
