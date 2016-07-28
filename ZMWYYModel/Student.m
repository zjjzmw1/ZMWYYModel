//
//  Student.m
//  ZMWYYModel
//
//  Created by speedx on 16/7/21.
//  Copyright © 2016年 speedx. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {// 匹配跟后台不一致的属性
        self.stuId = value;
    }
}

#pragma mark - YYModel用的:后台返回名字和属性名字不同的情况下用的
+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"stuId" : @"id",
//             @"name" : @"name",
//             @"age" : @"ext.desc",
//             @"brithday" : @[@"id",@"ID",@"book_id"]};
    
    return @{@"stuId":@"id"};
}

@end
