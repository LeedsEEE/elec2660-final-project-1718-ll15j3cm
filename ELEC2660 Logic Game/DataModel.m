//
//  DataModel.m
//  ELEC2660 Logic Game
//
//  Created by John Mitchell [ll15j3cm] on 24/11/2017.
//  Copyright © 2017 Johnny Mitchell. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

/*
 
Data model notes:

 Matrix:
    0 - no object
    1 - button/input OFF
    2 - button/input ON
    3 - light/output
    4 - wire/buffer OFF
    5 - wire/buffer ON
    6 - or gate
    7 - and gate
    8 - not gate
    9 - nand gate
 
 newInformation - Is there a tutorial screen before this level?
 
 informationText - What information will be displayed on the tutorial screen?
 
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        //Level 1
        self.levels = [NSMutableArray array];
        Level *level1 = [[Level alloc] init];
        level1.levelName = @"Level 1";
        //Pre defined and non-changable level layout
        level1.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@4,@0,@0,@0,@0,
                               @0,@0,@0,@0,@4,@0,@0,@0,@0,
                               @0,@0,@0,@0,@4,@0,@0,@0,@0,
                               @0,@0,@0,@0,@4,@0,@0,@0,@0,
                               @0,@0,@0,@0,@4,@0,@0,@0,@0,
                               @0,@0,@0,@0,@1,@0,@0,@0,@0
                               ];
        level1.outputMatrix = [[NSMutableArray alloc] initWithObjects:
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,nil];
        level1.newInformation = true;
        level1.informationText = @"The goal of this game is to enable the output light using the input buttons. Tap an input button to see this in action!";
        level1.complete = false;
        
        //Level 2
        self.levels = [NSMutableArray array];
        Level *level2 = [[Level alloc] init];
        level2.levelName = @"Level 2";
        //Pre defined and non-changable level layout
        level2.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @4,@4,@4,@4,@4,@4,@4,@4,@4,
                               @1,@1,@1,@1,@1,@1,@1,@1,@1
                               ];
        level2.outputMatrix = [[NSMutableArray alloc] initWithObjects:
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@2,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@1,@0,@0,@0,@0,nil];
        level2.newInformation = false;
        level2.informationText = @"";
        level2.complete = false;
        
        //Add levels to data model
        [self.levels addObject:level1]; //index 0
        [self.levels addObject:level2]; //index 1
        
    }
    return self;
}

@end
