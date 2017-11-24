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
    }
    
#pragma mark Generate Level
        
        //Get level map from the input matrix
        NSArray *currentLevel = self.level.inputMatrix;
        NSLog(@"%@",currentLevel);
        
        //Get screen dimensions
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        NSLog(@"Screen Height = %f",screenHeight);
        NSLog(@"Screen Width = %f",screenWidth);
        
        //Get the buttons on the bottom row and add them to the screen
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:72] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:72] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button1 addTarget:self
                        action:@selector(button1Pressed)
                forControlEvents:UIControlEventTouchUpInside];
            [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
            button1.frame = CGRectMake((screenWidth*0.0909), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button1];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:73] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:73] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button2 addTarget:self
                        action:@selector(button2Pressed)
              forControlEvents:UIControlEventTouchUpInside];
            [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
            button2.frame = CGRectMake((screenWidth*0.1818), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button2];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:74] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:74] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button3 addTarget:self
                        action:@selector(button3Pressed)
              forControlEvents:UIControlEventTouchUpInside];
            [button3 setTitle:@"Button 3" forState:UIControlStateNormal];
            button3.frame = CGRectMake((screenWidth*0.2727), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button3];
        }
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:75] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:75] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button4 addTarget:self
                        action:@selector(button4Pressed)
              forControlEvents:UIControlEventTouchUpInside];
            [button4 setTitle:@"Button 4" forState:UIControlStateNormal];
            button4.frame = CGRectMake((screenWidth*0.3636), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button4];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:76] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:76] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button5 addTarget:self
                        action:@selector(button5Pressed)
              forControlEvents:UIControlEventTouchUpInside];
            [button5 setTitle:@"Button 5" forState:UIControlStateNormal];
            button5.frame = CGRectMake((screenWidth*0.4545), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button5];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:77] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:77] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button6 addTarget:self
                        action:@selector(button6Pressed)
              forControlEvents:UIControlEventTouchUpInside];
            [button6 setTitle:@"Button 6" forState:UIControlStateNormal];
            button6.frame = CGRectMake((screenWidth*0.5454), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button6];
        }
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:78] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:78] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button7 addTarget:self
                        action:@selector(button7Pressed)
              forControlEvents:UIControlEventTouchUpInside];
            [button7 setTitle:@"Button 7" forState:UIControlStateNormal];
            button7.frame = CGRectMake((screenWidth*0.6363), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button7];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:79] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:79] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button8 addTarget:self
                        action:@selector(button8Pressed)
              forControlEvents:UIControlEventTouchUpInside];
            [button8 setTitle:@"Button 8" forState:UIControlStateNormal];
            button8.frame = CGRectMake((screenWidth*0.7272), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button8];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:80] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:80] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 1)
            UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button9 addTarget:self
                        action:@selector(button9Pressed)
              forControlEvents:UIControlEventTouchUpInside];
            [button9 setTitle:@"Button 9" forState:UIControlStateNormal];
            button9.frame = CGRectMake((screenWidth*0.8181), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [self.view addSubview:button9];
        }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)button1Pressed {
    NSLog(@"Button 1 Pressed");
}

- (void)button2Pressed {
    NSLog(@"Button 2 Pressed");
}

- (void)button3Pressed {
    NSLog(@"Button 3 Pressed");
}

- (void)button4Pressed {
    NSLog(@"Button 4 Pressed");
}

- (void)button5Pressed {
    NSLog(@"Button 5 Pressed");
}

- (void)button6Pressed {
    NSLog(@"Button 6 Pressed");
}

- (void)button7Pressed {
    NSLog(@"Button 7 Pressed");
}

- (void)button8Pressed {
    NSLog(@"Button 8 Pressed");
}

- (void)button9Pressed {
    NSLog(@"Button 9 Pressed");
}

@end
