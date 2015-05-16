//
//  ViewController.m
//  mp
//
//  Created by 王新国 on 15/5/15.
//  Copyright (c) 2015年 XXT. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"err");
    // Do any additional setup after loading the view, typically from a nib.
//    NSURL *URL = [NSURL URLWithString:@"http://apistore.baidu.com/microservice/iplookup?ip=117.89.35.58"];
//    NSURLRequest  *request = [NSURLRequest requestWithURL:URL];
    NSString *URL =@"http://apistore.baidu.com/microservice/iplookup";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"ip"] = @"117.89.35.58";
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:URL parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dicts =[NSDictionary dictionary];
        dicts= responseObject;
        NSArray *array = [[NSArray alloc]init];
        array =dicts[@"retData"];
        NSLog(@"%@",array);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

@end
