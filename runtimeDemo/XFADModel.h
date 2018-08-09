//
//  ADModel.h
//  MobileProject
//
//  Created by LiTengFang on 2017/3/29.
//  Copyright © 2017年 com.boli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFADModel : NSObject
@property(copy, nonatomic, setter = settingAd_height:) NSString *ad_height;
@property(strong, nonatomic) NSString *ad_name;
@property(strong,nonatomic) NSString *ad_pic;
@property(strong,nonatomic) NSString *ad_type;
@property(strong,nonatomic) NSString *ad_type_id;
@property(strong,nonatomic) NSString *ad_url;
@property(strong,nonatomic) NSString *ad_width;



//@property(strong,nonatomic) NSString *ad_date;
- (void)setDate:(NSString *)date;
- (NSString *)date;



@end
