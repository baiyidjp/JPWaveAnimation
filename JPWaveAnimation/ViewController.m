//
//  ViewController.m
//  JPWaveAnimation
//
//  Created by baiyi on 2018/6/6.
//  Copyright © 2018年 dong. All rights reserved.
//

#import "ViewController.h"
#import "JPWaveAnimationView.h"

@interface ViewController ()
/**  */
@property(nonatomic,strong) JPWaveAnimationView *waveView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor *color0 = [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:0.3f];
    UIColor *color1 = [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:0.5f];
    UIColor *color2 = [UIColor colorWithRed:255/255.f green:255/255.f blue:255/255.f alpha:0.7f];
    
    JPWaveAnimationView *waveView = [[JPWaveAnimationView alloc] initWithSize:CGSizeMake(200, 100) scaleY:0.7 colorArr:@[color0,color1,color2] scaleHeight:1.1];
    
    waveView.frame = CGRectMake(20, 100, 200, 100);
    
    waveView.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:waveView];
    
    self.waveView = waveView;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)begin:(id)sender {
    
    [self.waveView beginAnimation];
}
- (IBAction)end:(id)sender {
    
    [self.waveView stopAnimation];
}


@end
