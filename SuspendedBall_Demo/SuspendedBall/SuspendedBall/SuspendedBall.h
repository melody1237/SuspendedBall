//
//  SuspendedBall.h
//  test_SuspendedBall
//
//  Created by rongxin on 17/1/10.
//  Copyright © 2017年 rongxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLAnimatedImageView.h"
#import "FLAnimatedImage.h"

typedef void(^tapBlock)();

@interface SuspendedBall : FLAnimatedImageView

@property(copy,nonatomic)tapBlock clickBall;

-(instancetype)initWithFrame:(CGRect)frame andAction:(tapBlock)clickBall;
/// 加载本地图片
-(void)setLocalImageWithImageData:(NSData*)imageData;
/// 加载网络图片
-(void)setImageWithPath:(NSString *)imagePath;
@end
