//
//  VTTabBarController.m
//  ViewTracker
//
//  Created by xujunhao on 2017/5/24.
//  Copyright © 2017年 cocoadogs. All rights reserved.
//

#import "VTTabBarController.h"
#import "VTNavigationController.h"
#import "ViewController.h"


@interface VTTabBarController ()

@property (assign, nonatomic) NSUInteger currentIndex;
@property (copy, nonatomic) NSArray *tabBarButtons;

@end

@implementation VTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUIComponent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITabBarControllerDelegate Methods

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (_currentIndex != self.selectedIndex) {
        [self tabBarButtonClick:[self selTabBarButton]];
    }
}

#pragma mark - Action Methods

- (void)tabBarButtonClick:(UIControl *)tabBarButton {
    for (UIView *view in tabBarButton.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]||[view isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.1,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            [view.layer addAnimation:animation forKey:nil];
        }
    }
    _currentIndex = self.selectedIndex;
}

#pragma mark - Private Methods

- (UIControl *)selTabBarButton{
    return (UIControl *)self.tabBarButtons[self.selectedIndex];
}

#pragma mark - UI Init Methods

- (void)setUpUIComponent {
    UIColor *textColor = [UIColor redColor];
    UITabBarItem *item1 = [[UITabBarItem alloc] init];
    item1.tag = 1;
    [item1 setTitle:@"首页"];
    [item1 setImage:[UIImage imageNamed:@"home"]];
    [item1 setSelectedImage:[[UIImage imageNamed:@"home_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item1 setTitleTextAttributes:@{NSForegroundColorAttributeName: textColor}
                         forState:UIControlStateSelected];
    
    UITabBarItem *item2 = [[UITabBarItem alloc] init];
    item2.tag = 2;
    [item2 setTitle:@"投资"];
    [item2 setImage:[UIImage imageNamed:@"project"]];
    [item2 setSelectedImage:[[UIImage imageNamed:@"project_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item2 setTitleTextAttributes:@{NSForegroundColorAttributeName: textColor}
                         forState:UIControlStateSelected];
    
    UITabBarItem *item3 = [[UITabBarItem alloc] init];
    item3.tag = 3;
    [item3 setTitle:@"借款"];
    [item3 setImage:[UIImage imageNamed:@"new"]];
    [item3 setSelectedImage:[[UIImage imageNamed:@"new_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item3 setTitleTextAttributes:@{NSForegroundColorAttributeName: textColor}
                         forState:UIControlStateSelected];
    
    UITabBarItem *item4 = [[UITabBarItem alloc] init];
    item4.tag = 4;
    [item4 setTitle:@"账户"];
    [item4 setImage:[UIImage imageNamed:@"my"]];
    [item4 setSelectedImage:[[UIImage imageNamed:@"my_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item4 setTitleTextAttributes:@{NSForegroundColorAttributeName: textColor}
                         forState:UIControlStateSelected];
    
    
    ViewController *homeController = [[ViewController alloc] init];
    VTNavigationController *homeNavController = [[VTNavigationController alloc] initWithRootViewController:homeController];
    homeNavController.tabBarItem = item1;
    
    ViewController *investController = [[ViewController alloc] init];
    UINavigationController *projectNavController = [[UINavigationController alloc] initWithRootViewController:investController];
    projectNavController.tabBarItem = item2;
    
    ViewController *loanController = [[ViewController alloc] init];
    UINavigationController *messageNavController = [[UINavigationController alloc] initWithRootViewController:loanController];
    messageNavController.tabBarItem = item3;
    
    ViewController *myController = [[ViewController alloc] init];
    UINavigationController *myNavController = [[UINavigationController alloc] initWithRootViewController:myController];
    myNavController.tabBarItem = item4;
    
    self.viewControllers = [NSArray arrayWithObjects:homeNavController,projectNavController,messageNavController,myNavController, nil];
    self.delegate = (id)self;
    self.selectedIndex = 0;
}

#pragma mark - Lazy Load Methods

- (NSArray *)tabBarButtons {
    if (!_tabBarButtons) {
        NSMutableArray *tabBarButtons = [NSMutableArray new];
        for (UIView *tabBarButton in self.tabBar.subviews) {
            if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]){
                [tabBarButtons addObject:tabBarButton];
            }
        }
        _tabBarButtons = [tabBarButtons copy];
    }
    return _tabBarButtons;
}

@end
