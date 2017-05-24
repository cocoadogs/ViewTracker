//
//  VTNavigationController.m
//  ViewTracker
//
//  Created by xujunhao on 2017/5/24.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "VTNavigationController.h"

@interface VTNavigationController ()

@end

@implementation VTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barStyle = UIBarStyleBlack;
    
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
    [self.navigationBar.layer insertSublayer:[self gradientNavigationBarLayer] atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CAGradientLayer *)gradientNavigationBarLayer {
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.colors = @[(__bridge id)[UIColor colorWithRed:78 / 255.0 green:143 / 255.0 blue:1.0 alpha:1.0].CGColor,
                     (__bridge id)[UIColor colorWithRed:39 / 255.0 green:196 / 255.0 blue:254 / 255.0 alpha:1.0].CGColor,
                     (__bridge id)[UIColor colorWithRed:60 / 255.0 green:143 / 255.0 blue:1.0 alpha:1.0].CGColor];
    layer.locations = @[@0, @0.8, @1.0];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1.0, 0);
    layer.frame = CGRectMake(0, -20, self.navigationBar.bounds.size.width, 20 + self.navigationBar.bounds.size.height);
    return layer;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
