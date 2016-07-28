//
//  Student.h
//  ZMWYYModel
//
//  Created by speedx on 16/7/21.
//  Copyright © 2016年 speedx. All rights reserved.
//

/* 
 
 YYModel 调研结果：
 
 详细说明地址： https://github.com/ibireme/YYModel
 和其他类似库的对比和评测： http://blog.ibireme.com/2015/10/23/ios_model_framework_benchmark/
 
 优点：性能高、接近手写解析代码。
 转换安全、所有类型都检测一遍、避免崩溃。
 模型无需继承其他基类、框架就5个文件，很简单。
 
 缺点： 不支持 自定义属性转换方式 。 如果后端返回的字段和属性不同的话就赋值不上了。（作者解释的是：不想把 API 搞的太复杂了
 ）
 (自定义属性转换方式 需求倒是不多，万一用到了可以用系统自带的KVC 方式的，也非常简单。。或者直接自己一个一个的解析。)
 
 
 */


#import <Foundation/Foundation.h>

@interface Student : NSObject


@property (strong, nonatomic) NSString  *stuId;
@property (strong, nonatomic) NSString  *name;
@property (assign, nonatomic) int   age;
@property (strong, nonatomic) NSDate    *brithday;


+ (NSDictionary *)modelCustomPropertyMapper;

@end
