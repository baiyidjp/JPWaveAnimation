//
//  JPWaveAnimationView.m
//  JPWaveAnimation
//
//  Created by baiyi on 2018/6/6.
//  Copyright © 2018年 dong. All rights reserved.
//

#import "JPWaveAnimationView.h"

@implementation JPWaveAnimationView
{
    CADisplayLink *displayLink; //垂直刷新link
    CGFloat speed;   //沿X轴波峰移动速度
    CGFloat offsetX; //沿X轴波峰移动偏移量
    CGFloat offsetY; //沿Y轴波起点位置(即公式中的h)
    CGFloat waveWidth; //水波浪总宽度
    CGFloat A;          //上下的振幅
    NSMutableArray *layerArray;
    NSArray *colorsArr;
    CGFloat scaleH;
}
- (instancetype)initWithSize:(CGSize)size scaleY:(CGFloat)scaleY colorArr:(NSArray *)colorArr scaleHeight:(CGFloat)scaleHeight
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, size.width, size.height);
        self.backgroundColor = [UIColor clearColor];
        [self p_SetWithSize:size scaleY:scaleY colorArr:colorArr scaleHeight:scaleHeight];
    }
    return self;
}

#pragma mark -UI
- (void)p_SetWithSize:(CGSize)size scaleY:(CGFloat)scaleY colorArr:(NSArray *)colorArr scaleHeight:(CGFloat)scaleHeight{
    
    speed = 2.0f;
    offsetX = 0.f;
    offsetY = size.height *scaleY;
    waveWidth = size.width;
    A = 10.f;
    scaleH = scaleHeight;
    
    layerArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < colorArr.count; i++) {
        
        //创建水波纹layer
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.fillColor = [colorArr[i] CGColor];
        [self.layer addSublayer:layer];
        [layerArray addObject:layer];
    }
    
    colorsArr = colorArr;
}

- (void)drawRect:(CGRect)rect{
    
    /*
     正弦型函数解析式：y=Asin（ωx+φ）+h
     
     各常数值对函数图像的影响：
     
     φ（初相位）：决定波形与X轴位置关系或横向移动距离（左加右减）
     
     ω：决定周期（最小正周期T=2π/|ω|）
     
     A：决定峰值（即纵向拉伸压缩的倍数）
     
     h：表示波形在Y轴的位置关系或纵向移动距离（上加下减）
     
     */
    for (NSInteger i = 0; i < colorsArr.count; i ++) {
        CGFloat angle = 360.0f - 90.0f*i;
        CAShapeLayer *layer = layerArray[i];
        [self drawWaveLayerWithLayer:layer angle:angle];
    }
    
}

- (void)drawWaveLayer{
    
    [self setNeedsDisplay];
}

#pragma mark -
- (void)drawWaveLayerWithLayer:(CAShapeLayer *)layer angle:(CGFloat)angle {
    
    //1.计算随着时间推移的X轴偏移量
    offsetX += speed;
    
    CGMutablePathRef path = CGPathCreateMutable();
    //起点
    CGPathMoveToPoint(path, nil, 0, offsetY);
    
    CGFloat y;
    CGFloat ω = scaleH*M_PI/waveWidth;
    CGFloat φ = offsetX*(M_PI/angle);
    CGFloat h = offsetY;
    
    for (int x = 0; x <= waveWidth; x++) {
        y = A*sin(ω*x + (- φ)) + h*1;  //坐标系差异 需要转换 UIkit中 Y轴向下
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    //左下角点
    CGPathAddLineToPoint(path, nil, waveWidth, self.bounds.size.height);
    //右下角点
    CGPathAddLineToPoint(path, nil, 0, self.bounds.size.height);
    //闭合路径
    CGPathCloseSubpath(path);
    
    layer.path = path;
    //释放
    CGPathRelease(path);
    
}

- (void)beginAnimation {
    
    if (displayLink) {
        [self stopAnimation];
    }
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawWaveLayer)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)stopAnimation {
    
    if (displayLink) {
        
        [displayLink invalidate];
        displayLink = nil;
    }
}

@end
