//
//  DemoViewController.m
//  plist文件操作
//
//  Created by 陈家庆 on 15-2-5.
//  Copyright (c) 2015年 shikee_Chan. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //代码创建plist文件
    //获取本地沙盒路径
    /*
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //获取完整路径
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"usersList.plist"];
    NSMutableDictionary *usersDic = [[NSMutableDictionary alloc ] init];
    //设置属性值
    [usersDic setObject:@"chan" forKey:@"name"];
    [usersDic setObject:@"123456" forKey:@"password"];
    //写入文件
    [usersDic writeToFile:plistPath atomically:YES];
    
    NSLog(@"路径%@",plistPath);
    NSLog(@"内容%@",usersDic);
    */
    
//    //获取已有完整路径
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"usersList" ofType:@"plist"];
//    NSMutableDictionary *usersDic = [[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
//    //设置属性值,没有的数据就新建，已有的数据就修改。
//    [[usersDic objectForKey:@"users"] setObject:@"cjq" forKey:@"name"];
//    [[usersDic objectForKey:@"users"] setObject:@"dbdbdb" forKey:@"password"];
//    //写入文件
//    [usersDic writeToFile:plistPath atomically:YES];
//    NSLog(@"路径%@",plistPath);
//    NSLog(@"内容%@",usersDic);
    

    //首先读取usersList.plist中的数据
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"usersList" ofType:@"plist"];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
//    NSLog(@"plist文件%@",dictionary);
    
    //多层次结构
    //定义第一个类的属性
    NSMutableDictionary *dic1 = [[NSMutableDictionary alloc]init];
    [dic1 setObject:@"chan" forKey:@"name"];
    [dic1 setObject:@"123456" forKey:@"password"];
    //定义第二个类的属性
    NSMutableDictionary *dic2 = [[NSMutableDictionary alloc]init];
    [dic2 setObject:@"db" forKey:@"name"];
    [dic2 setObject:@"sbsbsb" forKey:@"password"];
    //设置属性值
    [dictionary setObject:dic1 forKey:@"用户一"];
    [dictionary setObject:dic2 forKey:@"用户二"];
    //写入文件
    [dictionary writeToFile:plistPath atomically:YES];
    
    NSString *plistPath1 = [[NSBundle mainBundle] pathForResource:@"usersList" ofType:@"plist"];
    NSMutableDictionary *data1 = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath1];
    NSLog(@"data1文件%@",data1);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
