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
    
    //Create level start Alert
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
        self.level.outputMatrix = [self.level.inputMatrix mutableCopy];
        NSLog(@"%@",self.level.outputMatrix);
    
        //Get screen dimensions
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        NSLog(@"Screen Height = %f",screenHeight);
        NSLog(@"Screen Width = %f",screenWidth);
        
        //Get the buttons on the bottom row and add them to the screen
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:72] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:72] intValue] == 1) {
            //Following code learned from https://stackoverflow.com/questions/1378765/how-do-i-create-a-basic-uibutton-programmatically
            //buttons (layer 9)
            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button1 addTarget:self
                        action:@selector(button1Pressed:)
                forControlEvents:UIControlEventTouchUpInside];
            [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
            button1.frame = CGRectMake((screenWidth*0.0909), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button1 layer] setBorderWidth:2.0f];
            [[button1 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:72];
            [button1 setSelected:NO];
            [self.view addSubview:button1];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:73] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:73] intValue] == 1) {
            UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button2 addTarget:self
                        action:@selector(button2Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
            button2.frame = CGRectMake((screenWidth*0.1818), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button2 layer] setBorderWidth:2.0f];
            [[button2 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:73];
            [button2 setSelected:NO];
            [self.view addSubview:button2];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:74] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:74] intValue] == 1) {
            UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button3 addTarget:self
                        action:@selector(button3Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button3 setTitle:@"Button 3" forState:UIControlStateNormal];
            button3.frame = CGRectMake((screenWidth*0.2727), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button3 layer] setBorderWidth:2.0f];
            [[button3 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:74];
            [button3 setSelected:NO];
            [self.view addSubview:button3];
        }
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:75] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:75] intValue] == 1) {
            UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button4 addTarget:self
                        action:@selector(button4Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button4 setTitle:@"Button 4" forState:UIControlStateNormal];
            button4.frame = CGRectMake((screenWidth*0.3636), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button4 layer] setBorderWidth:2.0f];
            [[button4 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:75];
            [button4 setSelected:NO];
            [self.view addSubview:button4];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:76] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:76] intValue] == 1) {
            UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button5 addTarget:self
                        action:@selector(button5Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button5 setTitle:@"Button 5" forState:UIControlStateNormal];
            button5.frame = CGRectMake((screenWidth*0.4545), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button5 layer] setBorderWidth:2.0f];
            [[button5 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:76];
            [button5 setSelected:NO];
            [self.view addSubview:button5];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:77] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:77] intValue] == 1) {
            UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button6 addTarget:self
                        action:@selector(button6Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button6 setTitle:@"Button 6" forState:UIControlStateNormal];
            button6.frame = CGRectMake((screenWidth*0.5454), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button6 layer] setBorderWidth:2.0f];
            [[button6 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:77];
            [button6 setSelected:NO];
            [self.view addSubview:button6];
        }
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:78] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:78] intValue] == 1) {
            UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button7 addTarget:self
                        action:@selector(button7Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button7 setTitle:@"Button 7" forState:UIControlStateNormal];
            button7.frame = CGRectMake((screenWidth*0.6363), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button7 layer] setBorderWidth:2.0f];
            [[button7 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:78];
            [button7 setSelected:NO];
            [self.view addSubview:button7];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:79] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:79] intValue] == 1) {
            UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button8 addTarget:self
                        action:@selector(button8Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button8 setTitle:@"Button 8" forState:UIControlStateNormal];
            button8.frame = CGRectMake((screenWidth*0.7272), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button8 layer] setBorderWidth:2.0f];
            [[button8 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:79];
            [button8 setSelected:NO];
            [self.view addSubview:button8];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:80] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:80] intValue] == 1) {
            UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button9 addTarget:self
                        action:@selector(button9Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button9 setTitle:@"Button 9" forState:UIControlStateNormal];
            button9.frame = CGRectMake((screenWidth*0.8181), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button9 layer] setBorderWidth:2.0f];
            [[button9 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:80];
            [button9 setSelected:NO];
            [self.view addSubview:button9];
        }
    //Images for Wires
    for (int i=0;i<=80;i++) {
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:i] intValue] == 4) {
            float xcoord = (screenWidth*((i%9)/11));
            float ycoord = (screenHeight*(((i-(i%9))/9)/11));
            UIImageView *wire =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
            wire.image=[UIImage imageNamed:@"logo.png"];
            [wire setTag:i];
            [self.view addSubview:wire];
            UIImageView *imgView = [self.view viewWithTag:i];
            [self.view addSubview:imgView];
        }
    }
    for (UIImageView *imgView in self.view.subviews) {
        if ([imgView isKindOfClass:[UIImageView class]]) {
            NSLog(@"imageview with tag %ld found", imgView.tag);
        }
    }
    [self updateMatrix];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 1 on");
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:72];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 1 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:72];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button2Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 2 on");
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:73];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 2 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:73];
        [sender setSelected:YES];
    }
    [self updateMatrix];
    
}

- (void)button3Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 3 on");
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:74];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 3 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:74];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button4Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 4 on");
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:75];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 4 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:75];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button5Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 5 on");
        NSLog(@"%d",[(NSNumber *)[self.level.outputMatrix objectAtIndex:76] intValue]);
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:76];
        NSLog(@"%d",[(NSNumber *)[self.level.outputMatrix objectAtIndex:76] intValue]);
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 5 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:76];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button6Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 6 on");
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:77];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 6 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:77];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button7Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 7 on");
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:78];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 7 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:78];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button8Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 8 on");
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:79];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 8 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:79];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button9Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 9 on");
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:80];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 9 off");
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:80];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)updateMatrix {
    NSLog(@"Updating output matrix...");
    bool levelComplete = true;
    bool updateRequired = false;
    for (int i = 0; i <= 80; i++) {
        //Check for bulbs being LIT
        if ([self.level.outputMatrix[i] isEqual:@9]) {
            if (([self.level.outputMatrix[i-9]  isEqual: @4])||([self.level.outputMatrix[i-9]  isEqual: @2])||
                ([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2])||
                ([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2])||
                ([self.level.outputMatrix[i+9]  isEqual: @4])||([self.level.outputMatrix[i+9]  isEqual: @2])) {
                [self.level.outputMatrix setObject:@10 atIndexedSubscript:i];
                updateRequired = true;
            }
        } else {
            //Update Wires
            if ([self.level.outputMatrix[i]  isEqual: @3]) {
                if (([self.level.outputMatrix[i-9]  isEqual: @4])||([self.level.outputMatrix[i-9]  isEqual: @2])||
                    ([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2])||
                    ([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2])||
                    ([self.level.outputMatrix[i+9]  isEqual: @4])||([self.level.outputMatrix[i+9]  isEqual: @2])) {
                    [self.level.outputMatrix setObject:@4 atIndexedSubscript:i];
                    updateRequired = true;
                }
            } else {
                //AND Gate
                if ([self.level.outputMatrix[i]  isEqual: @5]) {
                    if ((([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2]))&&
                        (([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2]))) {
                        if ([self.level.outputMatrix[i-9] isEqual:@3]) {
                            [self.level.outputMatrix setObject:@4 atIndexedSubscript:(i-9)];
                            updateRequired = true;
                        }
                    }
                }
            //OR Gate
            //NOT Gate
            //NAND Gate
            //NOR Gate
            }
        }
        if ([self.level.outputMatrix[i] isEqual:@9]) {
            levelComplete = false;
        }
    }
    //Print formatted array

    for (int i = 0; i <= 8; i++) {
        NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d",
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(0 + 9*i)] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(1 + 9*i)] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(2 + 9*i)] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(3 + 9*i)] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(4 + 9*i)] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(5 + 9*i)] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(6 + 9*i)] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(7 + 9*i)] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:(8 + 9*i)] intValue]);
    }
    //Re-call this function if there was a change to the level matrix
    if ((updateRequired)&&(!(levelComplete))) {
        NSLog(@"Update Required");
        [self updateMatrix];
    } else {
        if (levelComplete) {
            NSLog(@"Level Complete");
            self.level.complete = true;
        }
    }
}
@end
