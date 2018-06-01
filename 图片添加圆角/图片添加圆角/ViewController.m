//
//  ViewController.m
//  图片添加圆角
//
//  Created by Jason on 2018/6/1.
//  Copyright © 2018年 Jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第一种添加圆角方法,效率较差
//    [self addRoundAngle];
    
    //第二种添加圆角方法,效率高推荐
    [self addRadius];
   
}

- (void)addRoundAngle{
    self.imageView.image = [UIImage imageNamed:@"mm"];
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = true;
    [self.view addSubview:self.imageView];
    
}

- (void)addRadius {
    self.imageView.center = CGPointMake(200, 300);
    UIImage *anotherImage = [UIImage imageNamed:@"mm"];
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:self.imageView.bounds
                                cornerRadius:50] addClip];
    [anotherImage drawInRect:self.imageView.bounds];
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view addSubview:self.imageView];
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
