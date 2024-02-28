//
//  SuspendedBall.m
//  test_SuspendedBall
//
//  Created by rongxin on 17/1/10.
//  Copyright © 2017年 rongxin. All rights reserved.
//

#import "SuspendedBall.h"
#import "UIImageView+WebCache.h"

@implementation SuspendedBall

-(instancetype)initWithFrame:(CGRect)frame andAction:(tapBlock)clickBall {
    if (self = [super initWithFrame:frame]) {
        [self setBallWithAction:clickBall];
    }
    return self;
}

-(void)setBallWithAction:(tapBlock)clickBall {
    
    self.image = [UIImage imageNamed:@"SuspendedBall"];
    self.contentMode = UIViewContentModeScaleAspectFit;
//    self.backgroundColor = [UIColor greenColor];
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self setUserInteractionEnabled:YES];
    [self addGestureRecognizer:panGR];
    [self addGestureRecognizer:tapGR];
    self.clickBall = clickBall;
}

-(void)setLocalImageWithImageData:(NSData*)imageData {
    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:imageData];
    self.animatedImage = image;
}

-(void)setImageWithPath:(NSString *)imagePath {
    imagePath = [imagePath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [self sd_setImageWithURL:[NSURL URLWithString:imagePath] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
}
-(void)tap:(UITapGestureRecognizer*)sender {
    self.clickBall ? self.clickBall() : nil;
    
}
-(void)pan:(UIPanGestureRecognizer*)sender {
    CGPoint __block center = self.center;
    CGPoint translation = [sender translationInView:self.superview];
    
    if (center.x < 25) {
        
        center.x = self.bounds.size.width/2;
        
    }else if (center.x > self.superview.bounds.size.width - self.bounds.size.width/2) {
        
        center.x = self.superview.bounds.size.width - self.bounds.size.width/2;
        
    }else {
        
        center.x += translation.x;
        
    }
    
    if (center.y < 20) {
        
        center.y = self.bounds.size.height/2;
        
    }else if (center.y > self.superview.bounds.size.height - self.bounds.size.height/2) {
        
        center.y = self.superview.bounds.size.height - self.bounds.size.height/2;
        
    }else {
        
        center.y += translation.y;
        
    }
    
    self.center = center;
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            center.x = self.center.x > self.superview.bounds.size.width - self.center.x ? self.superview.bounds.size.width - self.bounds.size.width/2 : self.bounds.size.width/2;
            
            self.center = center;
            
        } completion:nil];
    }
    
    [sender setTranslation:CGPointZero inView:self.superview];
}
@end
