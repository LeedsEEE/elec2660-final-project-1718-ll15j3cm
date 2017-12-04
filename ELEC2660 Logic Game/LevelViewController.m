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

#pragma mark Generate Level
    //Get level map from the input matrix or savedata
    if ([self loadLevelCompleteData]) {
        self.level.outputMatrix = [self loadLevelMatrixData];
    } else {
        self.level.outputMatrix = [self.level.inputMatrix mutableCopy];
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
    }

    //Get screen dimensions
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    NSLog(@"Screen Height = %f",screenHeight);
    NSLog(@"Screen Width = %f",screenWidth);

    //Create buttons code
    for (int i = 0; i <= 80; i++) {
        if ([self.level.outputMatrix[i]  isEqual: @1]) {
            //create button
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTag:i];
            [button addTarget:self
                       action:@selector(buttonPressed:)
             forControlEvents:UIControlEventTouchUpInside];
            float xcoord = ((i+1)%9);
            button.frame = CGRectMake((screenWidth*(xcoord/11.00)), (screenHeight*(9.00/11.00)), (screenWidth/11), (screenHeight/11));
            [[button layer] setBorderWidth:2.0f];
            [self.view addSubview:button];
        }
    }
    
    //Initialise Map
    [self updateMatrix];
    //Initialise Sounds
    [self setupAudioPlayers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupAudioPlayers {
    //set URLs
    NSLog(@"Setting audio players");
    NSString *toneFilePath = [[NSBundle mainBundle] pathForResource:@"Tone" ofType:@"wav"];
    NSURL *toneFileURL = [[NSURL alloc] initFileURLWithPath:toneFilePath];
    NSString *blopFilePath = [[NSBundle mainBundle] pathForResource:@"Blop" ofType:@"wav"];
    NSURL *blopFileURL = [[NSURL alloc] initFileURLWithPath:blopFilePath];
    NSString *clickFilePath = [[NSBundle mainBundle] pathForResource:@"Click" ofType:@"wav"];
    NSURL *clickFileURL = [[NSURL alloc] initFileURLWithPath:clickFilePath];
    NSString *whooshFilePath = [[NSBundle mainBundle] pathForResource:@"Whoosh" ofType:@"wav"];
    NSURL *whooshFileURL = [[NSURL alloc] initFileURLWithPath:whooshFilePath];
    //Prepare sounds for later use
    self.tone = [[AVAudioPlayer alloc] initWithContentsOfURL:toneFileURL error:nil];
    [self.tone prepareToPlay];
    self.blop = [[AVAudioPlayer alloc] initWithContentsOfURL:blopFileURL error:nil];
    [self.blop prepareToPlay];
    self.click = [[AVAudioPlayer alloc] initWithContentsOfURL:clickFileURL error:nil];
    [self.click prepareToPlay];
    self.whoosh = [[AVAudioPlayer alloc] initWithContentsOfURL:whooshFileURL error:nil];
    [self.whoosh prepareToPlay];
}

- (void) playTone {
    //Check for sound overlap
    if ([self.tone isPlaying]) {
        [self.tone stop];
        self.tone.currentTime = 0.0;
    }
    [self.tone play];
}

- (void) playBlop {
    //Check for sound overlap
    if ([self.blop isPlaying]) {
        [self.blop stop];
        self.blop.currentTime = 0.0;
    }
    [self.blop play];
}

- (void) playClick {
    //Check for sound overlap
    if ([self.click isPlaying]) {
        [self.click stop];
        self.click.currentTime = 0.0;
    }
    [self.click play];
}

- (void) playWhoosh {
    //Check for sound overlap
    if ([self.whoosh isPlaying]) {
        [self.whoosh stop];
        self.whoosh.currentTime = 0.0;
    }
    [self.whoosh play];
}

#pragma mark Button Pressed Function
//Button pressed function
- (void)buttonPressed:(UIButton*)sender {
    NSInteger index = sender.tag;
    if([sender isSelected]){
        NSLog(@"Button with index %li on",(long)index);
        [self.level.outputMatrix setObject:@2 atIndexedSubscript:index];
        [[sender layer] setBorderColor:[UIColor greenColor].CGColor];
        UIImage *onImage = [UIImage imageNamed:@"ButtonOn.png"];
        [sender setImage:onImage forState:UIControlStateNormal];
        [sender setSelected:NO];
        [self playClick];
    } else {
        NSLog(@"Button with index %li off",(long)index);
        [self.level.outputMatrix setObject:@1 atIndexedSubscript:index];
        [[sender layer] setBorderColor:[UIColor redColor].CGColor];
        UIImage *offImage = [UIImage imageNamed:@"ButtonOff.png"];
        [sender setImage:offImage forState:UIControlStateNormal];
        [sender setSelected:YES];
        [self playClick];
    }
    [self updateMatrix];
}

#pragma mark Update Matrix
//These are the rules of the game.
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
        //Update Wires - Rules: 3 represents an OFF wire, 4 represents an ON wire and 99 represents a TEMPORARY wire
        //Update Wires - Logic: replace ON wires with TEMPORARY wires and replace TEMPORARY wires with OFF wires to avoid the OFF wires immediatly turning back on
        if ([self.level.outputMatrix[i]  isEqual: @3]) {
            //Update Image
            UIImageView *wire =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
            wire.image=[UIImage imageNamed:@"wireOff.png"];
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
                wire.image=[UIImage imageNamed:@"wireOn.png"];
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
                        ([self.level.outputMatrix[i+9]  isEqual: @5])||([self.level.outputMatrix[i+9]  isEqual: @6])||
                        ([self.level.outputMatrix[i+9]  isEqual: @7])||([self.level.outputMatrix[i+9]  isEqual: @8])||
                        ([self.level.outputMatrix[i+9]  isEqual: @11])) {
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
                        UIImageView *andGate =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                        andGate.image=[UIImage imageNamed:@"ANDGate.png"];
                        [self.view addSubview:andGate];
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
                            UIImageView *orGate =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                            orGate.image=[UIImage imageNamed:@"ORGate.png"];
                            [self.view addSubview:orGate];
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
                            //NOT Gate - logic: Check for input signal and output the opposite signal
                            if ([self.level.outputMatrix[i] isEqual: @7]) {
                                UIImageView *notGate =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                                notGate.image=[UIImage imageNamed:@"NOTGate.png"];
                                [self.view addSubview:notGate];
                                if (([self.level.outputMatrix[i+9] isEqual: @3])||([self.level.outputMatrix[i+9] isEqual: @1])) {
                                    if ([self.level.outputMatrix[i-9] isEqual:@3]) {
                                        [self.level.outputMatrix setObject:@4 atIndexedSubscript:(i-9)];
                                        updateRequired = true;
                                    }
                                } else {
                                    if (([self.level.outputMatrix[i+9] isEqual: @4])||([self.level.outputMatrix[i+9] isEqual: @2])) {
                                        if ([self.level.outputMatrix[i-9] isEqual:@4]) {
                                            [self.level.outputMatrix setObject:@99 atIndexedSubscript:(i-9)];
                                            updateRequired = true;
                                        }
                                    }
                                }
                            } else {
                                //NAND Gate - logic: If both side wires are on then outpu 0 else output 1
                                if ([self.level.outputMatrix[i] isEqual: @8]) {
                                    UIImageView *nandGate =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                                    nandGate.image=[UIImage imageNamed:@"NANDGate.png"];
                                    [self.view addSubview:nandGate];
                                    if ((([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2]))&&
                                        (([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2]))) {
                                        if ([self.level.outputMatrix[i-9] isEqual:@4]) {
                                            [self.level.outputMatrix setObject:@99 atIndexedSubscript:(i-9)];
                                            updateRequired = true;
                                        }
                                    } else {
                                        if ([self.level.outputMatrix[i-9] isEqual:@3]) {
                                            [self.level.outputMatrix setObject:@4 atIndexedSubscript:(i-9)];
                                            updateRequired = true;
                                        }
                                    }
                                } else {
                                    //NOR Gate - logic: if either side wire is on, output 0 else output 1
                                    if ([self.level.outputMatrix[i] isEqual: @11]) {
                                        UIImageView *norGate =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                                        norGate.image=[UIImage imageNamed:@"NORGate.png"];
                                        [self.view addSubview:norGate];
                                        if ((([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2]))||
                                            (([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2]))) {
                                            if ([self.level.outputMatrix[i-9] isEqual:@4]) {
                                                [self.level.outputMatrix setObject:@99 atIndexedSubscript:(i-9)];
                                                updateRequired = true;
                                            }
                                        } else {
                                            if ([self.level.outputMatrix[i-9] isEqual:@3]) {
                                                [self.level.outputMatrix setObject:@4 atIndexedSubscript:(i-9)];
                                                updateRequired = true;
                                            }
                                        }
                                    } else {
                                        //Check for bulbs being LIT
                                        if ([self.level.outputMatrix[i] isEqual:@9]) {
                                            UIImageView *bulb =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                                            bulb.image=[UIImage imageNamed:@"bulbOff.png"];
                                            [self.view addSubview:bulb];
                                            if (([self.level.outputMatrix[i-9]  isEqual: @4])||([self.level.outputMatrix[i-9]  isEqual: @2])||
                                                ([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2])||
                                                ([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2])||
                                                ([self.level.outputMatrix[i+9]  isEqual: @4])||([self.level.outputMatrix[i+9]  isEqual: @2])) {
                                                [self.level.outputMatrix setObject:@10 atIndexedSubscript:i];
                                                updateRequired = true;
                                                UIImageView *bulb =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                                                bulb.image=[UIImage imageNamed:@"bulbOn.png"];
                                                [self.view addSubview:bulb];
                                                [self playBlop];
                                            }
                                        } else {
                                            //Check for bulbs being unlit
                                            if ([self.level.outputMatrix[i] isEqual:@10]) {
                                                UIImageView *bulb =[[UIImageView alloc] initWithFrame:CGRectMake(xcoord, ycoord, (screenWidth/11), (screenHeight/11))];
                                                bulb.image=[UIImage imageNamed:@"bulbOn.png"];
                                                [self.view addSubview:bulb];
                                                if (!(([self.level.outputMatrix[i-9]  isEqual: @4])||([self.level.outputMatrix[i-9]  isEqual: @2])||
                                                      ([self.level.outputMatrix[i+1]  isEqual: @4])||([self.level.outputMatrix[i+1]  isEqual: @2])||
                                                      ([self.level.outputMatrix[i-1]  isEqual: @4])||([self.level.outputMatrix[i-1]  isEqual: @2])||
                                                      ([self.level.outputMatrix[i+9]  isEqual: @4])||([self.level.outputMatrix[i+9]  isEqual: @2]))) {
                                                    [self.level.outputMatrix setObject:@9 atIndexedSubscript:i];
                                                    updateRequired = true;
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
        }
        if ([self.level.outputMatrix[i] isEqual:@9]) {
            levelComplete = false;
        }
    }
    //Print formatted array

    for (int i = 0; i <= 8; i++) {
        NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d",
              //note: 1 + 9i is interpreted as a complex number and xcode gets confused
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
    //Re-call this function if there was a change to the level matrix, else set the level to completed
    if (updateRequired) {
        NSLog(@"Update Required");
        [self updateMatrix];
    } else {
        if (levelComplete) {
            [self playTone];
            NSLog(@"Level Complete");
            self.level.complete = true;
            [self saveData];
            [self endLevel];
        }
    }
}

-(void) saveData {
    //Code learned from https://stackoverflow.com/questions/307313/best-way-to-save-data-on-the-iphone
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *levelNum = [NSString stringWithFormat:@"%d",(int)self.level.levelNumber];
    NSString *levelName = self.level.levelName;
    [userDefaults setBool:self.level.complete forKey:levelNum];
    [userDefaults setObject:self.level.outputMatrix forKey:levelName];
    NSLog(@"Saved");
}

-(BOOL) loadLevelCompleteData {
    //Code learned from https://stackoverflow.com/questions/307313/best-way-to-save-data-on-the-iphone
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *levelNum = [NSString stringWithFormat:@"%d",(int)self.level.levelNumber];
    BOOL levelComplete = [userDefaults boolForKey:levelNum];
    if (levelComplete) {
        NSLog(@"Loaded level complete");
    } else {
        NSLog(@"Loaded level not complete");
    }
    return levelComplete;
}

-(NSMutableArray*) loadLevelMatrixData {
    //Code learned from https://stackoverflow.com/questions/19634426/how-to-save-nsmutablearray-in-nsuserdefaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *levelName = self.level.levelName;
    NSMutableArray *storedMatrix = [userDefaults objectForKey:levelName];
    return storedMatrix;
}

-(void) endLevel {
    //Code learned from https://useyourloaf.com/blog/uialertcontroller-changes-in-ios-8/
    //Create alert controller
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Level Complete!"
                                          message:@"Congratulations!"
                                          preferredStyle:UIAlertControllerStyleAlert];
    //create ok button
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK Action");
                                   [self.navigationController popToRootViewControllerAnimated:YES];
                               }];
    //add buttons to controller
    [alertController addAction:okAction];
    //create alert view
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
