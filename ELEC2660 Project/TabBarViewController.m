//
//  TabBarViewController.m
//  ELEC2660 Project
//
//  Created by Johnny Mitchell on 19/11/2017.
//  Copyright © 2017 Johnny Mitchell. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
}

//Code taken from https://stackoverflow.com/questions/29579992/positioning-uitabbar-at-the-top :
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.tabBar invalidateIntrinsicContentSize];
    
    CGFloat tabSize = 44.0;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        tabSize = 32.0;
    }
    
    CGRect tabFrame = self.tabBar.frame;
    
    tabFrame.size.height = tabSize;
    
    tabFrame.origin.y = self.view.frame.origin.y;
    
    self.tabBar.frame = tabFrame;
    
    // Set the translucent property to NO then back to YES to
    // force the UITabBar to reblur, otherwise part of the
    // new frame will be completely transparent if we rotate
    // from a landscape orientation to a portrait orientation.
    
    self.tabBar.translucent = NO;
    self.tabBar.translucent = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
