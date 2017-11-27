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
        NSMutableArray *currentLevel = [self.level.inputMatrix mutableCopy];
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
            //buttons (layer 9)
            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button1 addTarget:self
                        action:@selector(button1Pressed:)
                forControlEvents:UIControlEventTouchUpInside];
            [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
            button1.frame = CGRectMake((screenWidth*0.0909), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button1 layer] setBorderWidth:2.0f];
            [[button1 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button1];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:73] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:73] intValue] == 1) {
            UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button2 addTarget:self
                        action:@selector(button2Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
            button2.frame = CGRectMake((screenWidth*0.1818), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button2 layer] setBorderWidth:2.0f];
            [[button2 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button2];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:74] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:74] intValue] == 1) {
            UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button3 addTarget:self
                        action:@selector(button3Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button3 setTitle:@"Button 3" forState:UIControlStateNormal];
            button3.frame = CGRectMake((screenWidth*0.2727), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button3 layer] setBorderWidth:2.0f];
            [[button3 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button3];
        }
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:75] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:75] intValue] == 1) {
            UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button4 addTarget:self
                        action:@selector(button4Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button4 setTitle:@"Button 4" forState:UIControlStateNormal];
            button4.frame = CGRectMake((screenWidth*0.3636), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button4 layer] setBorderWidth:2.0f];
            [[button4 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button4];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:76] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:76] intValue] == 1) {
            UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button5 addTarget:self
                        action:@selector(button5Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button5 setTitle:@"Button 5" forState:UIControlStateNormal];
            button5.frame = CGRectMake((screenWidth*0.4545), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button5 layer] setBorderWidth:2.0f];
            [[button5 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button5];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:77] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:77] intValue] == 1) {
            UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button6 addTarget:self
                        action:@selector(button6Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button6 setTitle:@"Button 6" forState:UIControlStateNormal];
            button6.frame = CGRectMake((screenWidth*0.5454), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button6 layer] setBorderWidth:2.0f];
            [[button6 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button6];
        }
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:78] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:78] intValue] == 1) {
            UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button7 addTarget:self
                        action:@selector(button7Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button7 setTitle:@"Button 7" forState:UIControlStateNormal];
            button7.frame = CGRectMake((screenWidth*0.6363), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button7 layer] setBorderWidth:2.0f];
            [[button7 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button7];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:79] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:79] intValue] == 1) {
            UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button8 addTarget:self
                        action:@selector(button8Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button8 setTitle:@"Button 8" forState:UIControlStateNormal];
            button8.frame = CGRectMake((screenWidth*0.7272), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button8 layer] setBorderWidth:2.0f];
            [[button8 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button8];
        }
        
        
        NSLog(@"currentLevel: %d", [(NSNumber *)[currentLevel objectAtIndex:80] intValue]);
        if ([(NSNumber *)[currentLevel objectAtIndex:80] intValue] == 1) {
            UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
            [button9 addTarget:self
                        action:@selector(button9Pressed:)
              forControlEvents:UIControlEventTouchUpInside];
            [button9 setTitle:@"Button 9" forState:UIControlStateNormal];
            button9.frame = CGRectMake((screenWidth*0.8181), (screenHeight*(0.8)), (screenWidth/11), (screenHeight/11));
            [[button9 layer] setBorderWidth:2.0f];
            [[button9 layer] setBorderColor:[UIColor blackColor].CGColor];
            [self.view addSubview:button9];
        }
    
    for (int i=0;i<=80;i++) {
        if ([(NSNumber *)[currentLevel objectAtIndex:i] intValue] == 4) {
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
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 1 on");
        self.level.outputMatrix[72] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 1 off");
        self.level.outputMatrix[72] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button2Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 2 on");
        self.level.outputMatrix[73] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 2 off");
        self.level.outputMatrix[73] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
    
}

- (void)button3Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 3 on");
        self.level.outputMatrix[74] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 3 off");
        self.level.outputMatrix[74] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button4Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 4 on");
        self.level.outputMatrix[75] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 4 off");
        self.level.outputMatrix[75] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button5Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 5 on");
        self.level.outputMatrix[76] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 5 off");
        self.level.outputMatrix[76] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button6Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 6 on");
        self.level.outputMatrix[77] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 6 off");
        self.level.outputMatrix[77] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button7Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 7 on");
        self.level.outputMatrix[78] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 7 off");
        self.level.outputMatrix[78] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button8Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 8 on");
        self.level.outputMatrix[79] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 8 off");
        self.level.outputMatrix[79] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)button9Pressed:(UIButton*)sender {
    if([sender isSelected]){
        NSLog(@"Button 9 on");
        self.level.outputMatrix[80] = @2;
        [sender setSelected:NO];
    } else {
        NSLog(@"Button 9 off");
        self.level.outputMatrix[80] = @1;
        [sender setSelected:YES];
    }
    [self updateMatrix];
}

- (void)updateMatrix {
    NSLog(@"Updating output matrix...");
    bool updateRequired = false;
    for (int i = 80; i==0; i--) {
        //update wires
        if ([self.level.inputMatrix[i]  isEqual: @3]) {
            if (([self.level.inputMatrix[i-9]  isEqual: @4])||([self.level.inputMatrix[i-9]  isEqual: @2])||
                ([self.level.inputMatrix[i+1]  isEqual: @4])||([self.level.inputMatrix[i+1]  isEqual: @2])||
                ([self.level.inputMatrix[i-1]  isEqual: @4])||([self.level.inputMatrix[i-1]  isEqual: @2])||
                ([self.level.inputMatrix[i+9]  isEqual: @4])||([self.level.inputMatrix[i+9]  isEqual: @2])) {
                self.level.outputMatrix[i] = @4;
                updateRequired = true;
            }
        }
        //AND Gate
        if ([self.level.inputMatrix[i]  isEqual: @5]) {
            if ((([self.level.inputMatrix[i+1]  isEqual: @4])||([self.level.inputMatrix[i+1]  isEqual: @2]))&&
                (([self.level.inputMatrix[i-1]  isEqual: @4])||([self.level.inputMatrix[i-1]  isEqual: @2]))) {
                self.level.outputMatrix[i-9] = @4;
                updateRequired = true;
            }
        }
        //OR Gate
        //NOT Gate
        //NAND Gate
        //NOR Gate
    }
    //Print formatted array
    for (int i = 0; i==8; i++) {
        NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d",
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:0 + 9i] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:1 + 9i] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:2 + 9i] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:3 + 9i] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:4 + 9i] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:5 + 9i] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:6 + 9i] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:7 + 9i] intValue],
              [(NSNumber *)[self.level.outputMatrix objectAtIndex:8 + 9i] intValue]);
    }
}


@end
