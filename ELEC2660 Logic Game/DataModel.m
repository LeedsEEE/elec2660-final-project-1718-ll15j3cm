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
    3 - wire/buffer OFF
    4 - wire/buffer ON
    5 - and gate
    6 - or gate
    7 - not gate
    8 - nand gate
    9 - light OFF
   10 - light ON
   11 - NOR gate
   99 - Wire TURNED OFF STATE (Decays to 3)
 
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
                               @0,@0,@0,@0,@9,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
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
                               @0,@0,@9,@0,@0,@0,@9,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@1,@0,@0,@0,@1,@0,@0
                               ];
        level2.outputMatrix = [[NSMutableArray alloc] initWithObjects:
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,nil];
        level2.newInformation = false;
        level2.informationText = @"";
        level2.complete = false;
        
        //Level 3
        self.levels = [NSMutableArray array];
        Level *level3 = [[Level alloc] init];
        level3.levelName = @"Level 3";
        //Pre defined and non-changable level layout
        level3.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@9,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@3,@3,@5,@3,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@1,@0,@0,@0,@1,@0,@0
                               ];
        level3.outputMatrix = [[NSMutableArray alloc] initWithObjects:
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,nil];
        level3.newInformation = true;
        level3.informationText = @"This level introduces the AND gate! Turn both of it's side wires on to get the top wire to output!";
        level3.complete = false;
        
        //Level 4
        self.levels = [NSMutableArray array];
        Level *level4 = [[Level alloc] init];
        level4.levelName = @"Level 4";
        //Pre defined and non-changable level layout
        level4.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@9,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@0,@0,@3,@0,@0,@0,@0,
                               @0,@0,@3,@3,@5,@3,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@3,@5,@3,@0,@3,@5,@3,@0,
                               @0,@1,@0,@1,@0,@1,@0,@1,@0
                               ];
        level4.outputMatrix = [[NSMutableArray alloc] initWithObjects:
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,nil];
        level4.newInformation = false;
        level4.informationText = @"";
        level4.complete = false;
        
        //Level 5
        self.levels = [NSMutableArray array];
        Level *level5 = [[Level alloc] init];
        level5.levelName = @"Level 5";
        //Pre defined and non-changable level layout
        level5.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@9,@0,@0,@0,@0,@0,
                               @0,@0,@0,@3,@0,@0,@0,@0,@0,
                               @0,@3,@3,@5,@3,@0,@0,@0,@0,
                               @0,@3,@0,@0,@3,@0,@0,@0,@0,
                               @0,@3,@0,@3,@6,@3,@0,@0,@0,
                               @0,@3,@0,@3,@0,@3,@0,@0,@0,
                               @0,@3,@0,@3,@0,@3,@0,@0,@0,
                               @0,@1,@0,@1,@0,@1,@0,@0,@0
                               ];
        level5.outputMatrix = [[NSMutableArray alloc] initWithObjects:
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,nil];
        level5.newInformation = true;
        level5.informationText = @"This level introduces the OR gate! Turn on either of the adjacent inputs to output a 1!";
        level5.complete = false;
        
        //Level 6
        self.levels = [NSMutableArray array];
        Level *level6 = [[Level alloc] init];
        level6.levelName = @"Level 6";
        //Pre defined and non-changable level layout
        level6.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@9,@0,@0,@0,@0,@0,
                               @0,@0,@0,@3,@0,@0,@0,@0,@0,
                               @0,@0,@3,@5,@3,@0,@0,@0,@0,
                               @0,@0,@3,@0,@3,@0,@0,@0,@0,
                               @0,@0,@3,@0,@7,@0,@0,@0,@0,
                               @0,@0,@3,@0,@3,@0,@0,@0,@0,
                               @0,@0,@3,@0,@3,@0,@0,@0,@0,
                               @0,@0,@1,@0,@1,@0,@0,@0,@0
                               ];
        level6.outputMatrix = [[NSMutableArray alloc] initWithObjects:
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,nil];
        level6.newInformation = false;
        level6.informationText = @"";
        level6.complete = false;
        
        //Level 7
        self.levels = [NSMutableArray array];
        Level *level7 = [[Level alloc] init];
        level7.levelName = @"Level 7";
        //Pre defined and non-changable level layout
        level7.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@9,@0,@0,@0,@0,@0,
                               @0,@0,@0,@3,@0,@0,@0,@0,@0,
                               @0,@0,@3,@5,@3,@3,@3,@0,@0,
                               @0,@0,@3,@0,@0,@0,@3,@0,@0,
                               @0,@0,@3,@0,@0,@3,@6,@3,@0,
                               @0,@3,@6,@3,@0,@7,@0,@3,@0,
                               @0,@3,@0,@3,@3,@3,@0,@3,@0,
                               @0,@1,@0,@0,@1,@0,@0,@1,@0
                               ];
        level7.outputMatrix = [[NSMutableArray alloc] initWithObjects:
                               @0,@0,@0,@0,@0,@0,@0,@0,@0, //starts at index 0
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,nil];
        level7.newInformation = false;
        level7.informationText = @"!";
        level7.complete = false;
        
        //Add levels to data model
        [self.levels addObject:level1]; //index 0
        [self.levels addObject:level2]; //index 1
        [self.levels addObject:level3]; //index 2
        [self.levels addObject:level4]; //index 3
        [self.levels addObject:level5]; //index 4
        [self.levels addObject:level6]; //index 5
        [self.levels addObject:level7]; //index 6
    }
    return self;
}

@end
