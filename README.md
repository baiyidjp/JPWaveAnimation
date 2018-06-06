# JPWaveAnimation
一句代码调用的可定制的波浪动画 看demo


![波浪](https://github.com/baiyidjp/JPWaveAnimation/blob/master/JPWaveAnimation/image/%E6%B3%A2%E6%B5%AA.gif?raw=true)

```
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

```
