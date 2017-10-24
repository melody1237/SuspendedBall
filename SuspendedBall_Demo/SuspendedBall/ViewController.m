//
//  ViewController.m
//  SuspendedBall
//
//  Created by rongxin on 17/1/11.
//  Copyright © 2017年 rongxin. All rights reserved.
//

#import "ViewController.h"
#import "SuspendedBall.h"
#import "SecondViewController.h"

#import "UIImageView+WebCache.h"
#import "FLAnimatedImage.h"

@interface ViewController ()
@property(nonatomic,strong)NSData *imageData;

@end

@implementation ViewController

-(NSData *)imageData {
    
    if (!_imageData) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"niudan" ofType:@"gif"];
        _imageData = [NSData dataWithContentsOfFile:path];
    }
    return _imageData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第一个控制器";
    self.view.backgroundColor = [UIColor grayColor];
    
    SuspendedBall *ball = [[SuspendedBall alloc] initWithFrame:CGRectMake(0, 100, 60, 60) andAction:^{
        // 这里可以处理点击事件
        NSLog(@"图片被点击");
        SecondViewController *secondVC = [[SecondViewController alloc] init];
        [self.navigationController pushViewController:secondVC animated:YES];
    }];
    
    // 有默认的图片，但也可以在这里修改
    
    // 加载本地动图
    [ball setLocalImageWithImageData:self.imageData];
    
    // 从网络加载动图
//    NSString *urlStr = @"http://7jpnak.com1.z0.glb.clouddn.com/-2_1508812812584_扭蛋机动效3.gif";
//    [ball setImageWithPath:urlStr];
    
    [self.view addSubview:ball];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
