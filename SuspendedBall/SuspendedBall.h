//
//  SuspendedBall.h
//  test_SuspendedBall
//
//  Created by rongxin on 17/1/10.
//  Copyright © 2017年 rongxin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tapBlock)();

@interface SuspendedBall : UIImageView

@property(copy,nonatomic)tapBlock clickBall;

@end
