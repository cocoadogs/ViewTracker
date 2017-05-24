//
//  ViewController.m
//  ViewTracker
//
//  Created by xujunhao on 2017/5/24.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ViewTracker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar traversing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
