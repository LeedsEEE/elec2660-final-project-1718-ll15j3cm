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
            [button1 setTag:72];
            [button1 addTarget:self
                        action:@selector(buttonPressed:)
                forControlEvents:UIControlEventTouchUpInside];
            [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
            button1.frame = CGRectMake((screenWidth*0.0909), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button1 layer] setBorderWidth:2.0f];
            [[button1 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:72];
            [button1 setSelected:NO];
            [self.view addSubview:button1];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:73] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:73] intValue] == 1) {
            UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button2 setTag:73];
            [button2 addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
            button2.frame = CGRectMake((screenWidth*0.1818), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button2 layer] setBorderWidth:2.0f];
            [[button2 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:73];
            [button2 setSelected:NO];
            [self.view addSubview:button2];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:74] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:74] intValue] == 1) {
            UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button3 setTag:74];
            [button3 addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button3 setTitle:@"Button 3" forState:UIControlStateNormal];
            button3.frame = CGRectMake((screenWidth*0.2727), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button3 layer] setBorderWidth:2.0f];
            [[button3 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:74];
            [button3 setSelected:NO];
            [self.view addSubview:button3];
        }
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:75] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:75] intValue] == 1) {
            UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button4 setTag:75];
            [button4 addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button4 setTitle:@"Button 4" forState:UIControlStateNormal];
            button4.frame = CGRectMake((screenWidth*0.3636), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button4 layer] setBorderWidth:2.0f];
            [[button4 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:75];
            [button4 setSelected:NO];
            [self.view addSubview:button4];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:76] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:76] intValue] == 1) {
            UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button5 setTag:76];
            [button5 addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button5 setTitle:@"Button 5" forState:UIControlStateNormal];
            button5.frame = CGRectMake((screenWidth*0.4545), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button5 layer] setBorderWidth:2.0f];
            [[button5 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:76];
            [button5 setSelected:NO];
            [self.view addSubview:button5];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:77] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:77] intValue] == 1) {
            UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button6 setTag:77];
            [button6 addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button6 setTitle:@"Button 6" forState:UIControlStateNormal];
            button6.frame = CGRectMake((screenWidth*0.5454), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button6 layer] setBorderWidth:2.0f];
            [[button6 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:77];
            [button6 setSelected:NO];
            [self.view addSubview:button6];
        }
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:78] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:78] intValue] == 1) {
            UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button7 setTag:78];
            [button7 addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button7 setTitle:@"Button 7" forState:UIControlStateNormal];
            button7.frame = CGRectMake((screenWidth*0.6363), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button7 layer] setBorderWidth:2.0f];
            [[button7 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:78];
            [button7 setSelected:NO];
            [self.view addSubview:button7];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:79] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:79] intValue] == 1) {
            UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button8 setTag:79];
            [button8 addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button8 setTitle:@"Button 8" forState:UIControlStateNormal];
            button8.frame = CGRectMake((screenWidth*0.7272), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button8 layer] setBorderWidth:2.0f];
            [[button8 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:79];
            [button8 setSelected:NO];
            [self.view addSubview:button8];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[self.level.outputMatrix objectAtIndex:80] intValue]);
        if ([(NSNumber *)[self.level.outputMatrix objectAtIndex:80] intValue] == 1) {
            UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button9 setTag:80];
            [button9 addTarget:self
                        action:@selector(buttonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button9 setTitle:@"Button 9" forState:UIControlStateNormal];
            button9.frame = CGRectMake((screenWidth*0.8181), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button9 layer] setBorderWidth:2.0f];
            [[button9 layer] setBorderColor:[UIColor redColor].CGColor];
            [self.level.outputMatrix setObject:@1 atIndexedSubscript:80];
            [button9 setSelected:NO];
            [self.view addSubview:button9];
        }
    //Initialise Map
    [self updateMatrix];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Button Pressed Function

//Button pressed function
- (void)buttonPressed:(UIButton*)sender {
    NSInteger index = sender.tag;
    if([sender isSelected]){
        NSLog(@"Button with index %li on",(long)index);
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:index];
        [[sender layer] setBorderColor:[UIColor greenColor].CGColor];
        [sender setSelected:NO];
    } else {
        NSLog(@"Button with index %li off",(long)index);
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:index];
        [[sender layer] setBorderColor:[UIColor redColor].CGColor];
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

#pragma mark Update Matrix

//THIS WORKS DO NOT TOUCH
- (void)updateMatrix {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    NSLog(@"Updating output matrix...");
    bool levelComplete = true;
    bool updateRequired = false;
    for (int i = 0; i <= 80; i++) {
        float xcoord = (screenWidth*((1+(i%9))/11.00));
        float ycoord = (screenHeight*((1+((i-(i%9))/9.00))/11.00));
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
            if ([self.level.outputMatrix[i] isEqual:@10]) {
                if (!(([self.level.outputMatrix[i-9]  isEqual: @4])||([self.level.outputMatrix[i-9]  isEqual: @2])||
                    ([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2])||
                    ([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2])||
                    ([self.level.outputMatrix[i+9]  isEqual: @4])||([self.level.outputMatrix[i+9]  isEqual: @2]))) {
                    [self.level.outputMatrix setObject:@9 atIndexedSubscript:i];
                    updateRequired = true;
                }
            } else {
                //Update Wires - Rules: 3 represents an OFF wire, 4 represents an ON wire and 99 represents a TEMPORARY wire
                //Update Wires - Logic: replace ON wires with TEMPORARY wires and replace TEMPORARY wires with OFF wires to avoid the OFF wires immediatly turning back on
                if ([self.level.outputMatrix[i]  isEqual: @3]) {
                    //Update Image
                    UIImageView *wire =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                    wire.image=[UIImage imageNamed:@"logo.png"];
                    [self.view addSubview:wire];
                        if (([self.level.outputMatrix[i-9]  isEqual: @4])||([self.level.outputMatrix[i-9]  isEqual: @2])||
                            ([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2])||
                            ([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2])||
                            ([self.level.outputMatrix[i+9]  isEqual: @4])||([self.level.outputMatrix[i+9]  isEqual: @2])) {
                            [self.level.outputMatrix setObject:@4 atIndexedSubscript:i];
                            updateRequired = true;
                        }
                } else {
                    //Replace ON wires with TEMPORARY wires
                    if ([self.level.outputMatrix[i]  isEqual: @4]) {
                        //Update Image
                        UIImageView *wire =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                        wire.image=[UIImage imageNamed:@"Background Texture.png"];
                        [self.view addSubview:wire];
                        if (([self.level.outputMatrix[i-9]  isEqual: @1])||([self.level.outputMatrix[i+1]  isEqual: @1])||
                            ([self.level.outputMatrix[i-1]  isEqual: @1])||([self.level.outputMatrix[i+9]  isEqual: @1])) {
                            [self.level.outputMatrix setObject:@99 atIndexedSubscript:i];
                            updateRequired = true;
                        } else {
                            if (([self.level.outputMatrix[i-9]  isEqual: @99])||([self.level.outputMatrix[i+1]  isEqual: @99])||
                                ([self.level.outputMatrix[i-1]  isEqual: @99])||([self.level.outputMatrix[i+9]  isEqual: @99])) {
                                [self.level.outputMatrix setObject:@99 atIndexedSubscript:i];
                                updateRequired = true;
                            }
                        }
                    } else {
                        //Replace TEMPORARY wires with OFF wires
                        if ([self.level.outputMatrix[i]  isEqual: @99]) {
                            //No texture because wires are temporary
                            if (([self.level.outputMatrix[i-9]  isEqual: @1])||([self.level.outputMatrix[i+1]  isEqual: @1])||
                                ([self.level.outputMatrix[i-1]  isEqual: @1])||([self.level.outputMatrix[i+9]  isEqual: @1])||
                                ([self.level.outputMatrix[i+9]  isEqual: @5])) {
                                [self.level.outputMatrix setObject:@3 atIndexedSubscript:i];
                                updateRequired = true;
                            } else {
                                if (([self.level.outputMatrix[i-9]  isEqual: @3])||([self.level.outputMatrix[i+1]  isEqual: @3])||
                                    ([self.level.outputMatrix[i-1]  isEqual: @3])||([self.level.outputMatrix[i+9]  isEqual: @3])) {
                                    [self.level.outputMatrix setObject:@3 atIndexedSubscript:i];
                                    updateRequired = true;
                                }
                            }
                        } else {
                            //AND Gate - logic: Take 2 sides as inputs and output if they are both on.
                            if ([self.level.outputMatrix[i]  isEqual: @5]) {
                                if ((([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2]))&&
                                    (([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2]))) {
                                    if ([self.level.outputMatrix[i-9] isEqual:@3]) {
                                        [self.level.outputMatrix setObject:@4 atIndexedSubscript:(i-9)];
                                        updateRequired = true;
                                    }
                                } else {
                                    if ([self.level.outputMatrix[i-9] isEqual:@4]) {
                                        [self.level.outputMatrix setObject:@99 atIndexedSubscript:(i-9)];
                                        updateRequired = true;
                                    }
                                }
                            } else {
                                //OR Gate - logic: Take 2 sides as inputs and output if either or both are on.
                                if ([self.level.outputMatrix[i] isEqual: @6]) {
                                    if ((([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2]))||
                                        (([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2]))) {
                                        if ([self.level.outputMatrix[i-9] isEqual:@3]) {
                                            [self.level.outputMatrix setObject:@4 atIndexedSubscript:(i-9)];
                                            updateRequired = true;
                                        }
                                    } else {
                                        if ([self.level.outputMatrix[i-9] isEqual:@4]) {
                                            [self.level.outputMatrix setObject:@99 atIndexedSubscript:(i-9)];
                                            updateRequired = true;
                                        }
                                    }
                                } else {
                                    //NOT Gate
                                    if ([self.level.outputMatrix[i] isEqual: @7]) {
                                        
                                    } else {
                                        //NAND Gate
                                        if ([self.level.outputMatrix[i] isEqual: @8]) {
                                            
                                        } else {
                                            //NOR Gate
                                            if ([self.level.outputMatrix[i] isEqual: @11]) {
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
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
