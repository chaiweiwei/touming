//
//  ViewController.m
//  渐变透明
//
//  Created by 求攻略 on 15/3/12.
//  Copyright (c) 2015年 求攻略. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CAGradientLayer *_gradientLayer;
    UIView *_layerView;
    UIImageView *_imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 350, 150, 100)];
    [button setTitle:@"显示/隐藏标题" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    _imageView.frame = CGRectMake(0, 0, 320, 320);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 320, 100)];
    label.text = @"我是标题标题标题！";
    label.textColor = [UIColor whiteColor];
    
    
    _layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 320-100, 320, 100)];
    
    _gradientLayer = [CAGradientLayer layer];  // 设置渐变效果
    _gradientLayer.bounds = _layerView.bounds;
    _gradientLayer.borderWidth = 0;
    
    _gradientLayer.frame = _layerView.bounds;
    _gradientLayer.colors = [NSArray arrayWithObjects:
                             (id)[[UIColor clearColor] CGColor],
                             (id)[[UIColor blackColor] CGColor], nil,nil];
    _gradientLayer.startPoint = CGPointMake(0.5, 0.5);
    _gradientLayer.endPoint = CGPointMake(0.5, 1.0);
    
    [_layerView.layer insertSublayer:_gradientLayer atIndex:0];
    
    [_imageView addSubview:_layerView];
    [_layerView addSubview:label];
    [self.view addSubview:_imageView];
}
- (void)buttonPressed
{
    static BOOL yesOrNo = YES;
    if (yesOrNo) {
        [_layerView removeFromSuperview];
    } else {
        [_imageView addSubview:_layerView];
    }
    yesOrNo = !yesOrNo;
    
}
@end
