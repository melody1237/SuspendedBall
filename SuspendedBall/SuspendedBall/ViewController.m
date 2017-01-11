//
//  ViewController.m
//  SuspendedBall
//
//  Created by rongxin on 17/1/11.
//  Copyright © 2017年 rongxin. All rights reserved.
//

#import "ViewController.h"
#import "SuspendedBall.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    SuspendedBall *ball = [[SuspendedBall alloc] initWithFrame:CGRectMake(0, 100, 60, 60)];
    // 有默认的图片，也可以在这里修改
    ball.image = [UIImage imageNamed:@"touxiang"];
    
    ball.clickBall = ^{
        // 这里可以处理点击事件
        NSLog(@"图片被点击");
    };
    
    [self.view addSubview:ball];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
