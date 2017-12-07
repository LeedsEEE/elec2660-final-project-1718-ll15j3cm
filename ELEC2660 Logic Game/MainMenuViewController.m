//
//  FirstViewController.m
//  ELEC2660 Logic Game
//
//  Created by Johnny Mitchell on 23/11/2017.
//  Copyright © 2017 Johnny Mitchell. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clearData:(UIButton *)sender {
    //Code learned from https://useyourloaf.com/blog/uialertcontroller-changes-in-ios-8/
    //Create alert controller
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Clear Save Data"
                                          message:@"Delete all save data?"
                                          preferredStyle:UIAlertControllerStyleAlert];
    //create cancel button
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    //create ok button
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                                   //Code learned from https://stackoverflow.com/questions/545091/clearing-nsuserdefaults
                                   NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
                                   [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
                                   NSLog(@"Save data cleared!");
                                   
                               }];
    //add buttons to controller
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    //create alert view
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
