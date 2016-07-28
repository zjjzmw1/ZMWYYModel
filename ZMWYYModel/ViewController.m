//
//  ViewController.m
//  ZMWYYModel
//
//  Created by speedx on 16/7/21.
//  Copyright © 2016年 speedx. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "YYModel.h"


@interface ViewController ()

@property (strong, nonatomic) Student *stu;
@property (strong, nonatomic) NSMutableDictionary *dict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 系统赋值的方式
//    [self setModalForDictSystem];

    // YYModel赋值的方式
    [self setModalForDictYYModel];
}


#pragma mark - 系统自带的方式  
/*
 1.后台返回字段和自己属性不同的话，需要在model的.m中添加方法就OK了。
 2.自己的属性，后台没有返回的话，属性相当于没初始化，不会崩溃。
 3.后台返回的字段，自己属性没有也没有问题，不会崩溃。
 4.后台类型和自己属性类型不同的时候，会赋值为后台返回的类型（不太好！！如果把字符串当成date类型用的话，会崩溃,还不如为空呢），不会崩溃
 5.自动类型转换OK，字符串和int类型可以自动转换 例如:后台返回age = @"12a" 自动解析为12，后台返回name = @(23) 自动解析为 @“23”
 */
- (void) setModalForDictSystem {
    self.dict = [NSMutableDictionary dictionary];
    [self.dict setObject:@(123) forKey:@"name"];
    [self.dict setObject:@"9sadf9df" forKey:@"id"];
    [self.dict setObject:@"beijing" forKey:@"school"];

//    [self.dict setObject:@"ds" forKey:@"brithday"];
    [self.dict setObject:@"1233e" forKey:@"age"];
    
    self.stu = [[Student alloc]init];
    [self.stu setValuesForKeysWithDictionary:self.dict];
    
    NSLog(@"name=%@,age=%d,id=%@,brithday=%@",self.stu.name,self.stu.age,self.stu.stuId,self.stu.brithday);
}

#pragma mark - YYModel 的方式
/*
 1.后台返回字段和自己属性不同的话，需要写个类似的转换方法。
 2.自己的属性，后台没有返回的话，属性相当于没初始化，不会崩溃。
 3.后台返回的字段，自己属性没有也没有问题，不会崩溃。
 4.后台类型和自己属性类型不同的时候，会赋值空，不会崩溃
 5.自动类型转换OK，字符串和int类型可以自动转换 例如:后台返回age = @"12a" 自动解析为12，后台返回name = @(23) 自动解析为 @“23”

 */
- (void) setModalForDictYYModel {
    self.dict = [NSMutableDictionary dictionary];
    [self.dict setObject:@(123) forKey:@"name"];
    [self.dict setObject:@"9sadf9df" forKey:@"id"];
    [self.dict setObject:[NSDate date] forKey:@"brithday"];
    [self.dict setObject:@"2134a" forKey:@"age"];
    [self.dict setObject:@"beijing" forKey:@"school"];

    
    self.stu = [[Student alloc]init];
    [Student modelCustomPropertyMapper];
    [self.stu yy_modelSetWithDictionary:self.dict];
    
    NSLog(@"name=%@,age=%d,id=%@,brithday=%@",self.stu.name,self.stu.age,self.stu.stuId,self.stu.brithday);
}

@end
