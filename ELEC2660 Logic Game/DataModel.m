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
    1 - button/input
    2 - light/output
    3 - wire/buffer
    4 - or gate
    5 - and gate
    6 - not gate
    7 - nor gate
    8 - nand gate
    9 - 
 
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
        level1.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@2,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@1,@0,@0,@0,@0
                               ];
        level1.outputMatrix = @[
                                @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0
                                ];
        level1.newInformation = true;
        level1.informationText = @"The goal of this game is to enable the output light using the input buttons. Tap an input button to see this in action!";
        level1.complete = false;
        
        //Level 2
        self.levels = [NSMutableArray array];
        Level *level2 = [[Level alloc] init];
        level2.levelName = @"Level 2";
        level2.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @1,@1,@1,@1,@1,@1,@1,@1,@1
                               ];
        level2.outputMatrix = @[
                                @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0
                                ];
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
