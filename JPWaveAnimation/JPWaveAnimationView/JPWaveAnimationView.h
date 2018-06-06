//
//  JPWaveAnimationView.h
//  JPWaveAnimation
//
//  Created by baiyi on 2018/6/6.
//  Copyright © 2018年 dong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPWaveAnimationView : UIView

- (instancetype)initWithSize:(CGSize)size scaleY:(CGFloat)scaleY colorArr:(NSArray *)colorArr scaleHeight:(CGFloat)scaleHeight;

- (void)stopAnimation;
- (void)beginAnimation;


@end
