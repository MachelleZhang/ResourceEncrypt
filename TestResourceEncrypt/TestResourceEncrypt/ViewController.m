//
//  ViewController.m
//  TestResourceEncrypt
//
//  Created by ZhangLe on 2020/7/8.
//  Copyright © 2020 AsiaInfo Mobile. All rights reserved.
//

#import "ViewController.h"
#import <RNCryptor/RNOpenSSLDecryptor.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Config" ofType:@"plist"];
//    if (path && ![path isEqualToString:@""]) {
//        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
//        NSLog(@"%@", dic);
//    } else {
//        NSLog(@"%@", path);
//    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ConfigEncrypt" ofType:@"plist"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (data) {
        NSError *error;
        NSData *decryptData = [RNOpenSSLDecryptor decryptData:data withSettings:kRNCryptorAES256Settings password:@"fwe&*^123213" error:&error];
        NSMutableDictionary *plist = [NSPropertyListSerialization propertyListWithData:decryptData options:(NSPropertyListImmutable) format:nil error:&error];
        NSLog(@"%@", plist);
    } else {
        NSLog(@"%@", path);
    }
}


@end
