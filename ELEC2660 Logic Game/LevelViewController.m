//
//  SecondViewController.m
//  ELEC2660 Logic Game
//
//  Created by Johnny Mitchell on 23/11/2017.
//  Copyright © 2017 Johnny Mitchell. All rights reserved.
//

#import "LevelViewController.h"

@interface LevelViewController()

@end

@implementation LevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.levelName.text = self.level.levelName;
    
#pragma mark Alert
    
    if (self.level.newInformation == true) {
        //Code learned from https://useyourloaf.com/blog/uialertcontroller-changes-in-ios-8/
        //Create alert controller
        UIAlertController *alertController = [UIAlertController
                                    alertControllerWithTitle:@"Level Tips"
                                    message:self.level.informationText
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
                                   }];
        //add buttons to controller
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        //create alert view
        [self presentViewController:alertController animated:YES completion:nil];

#pragma mark Generate Level
        
        //Get level map from the input matrix
        NSArray *currentLevel = self.level.inputMatrix;
        NSLog(@"%@",currentLevel);
        
        //Get screen dimensions
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        NSLog(@"Height = %f",screenHeight);
        NSLog(@"Width = %f",screenWidth);
        
        
        //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
        //buttons (layer 1)
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [button1 addTarget:self
                   action:@selector(button1Pressed)
         forControlEvents:UIControlEventTouchUpInside];
        [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
        button1.frame = CGRectMake((screenWidth/10), (screenHeight*(6/10)), (screenWidth/10), (screenHeight/10));
        [self.view addSubview:button1];
        
        
        
        
        
        
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)button1Pressed {
    NSLog(@"Button 1 Pressed");
}



@end
