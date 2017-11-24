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
    0 - 
    1 - 
    2 - 
    3 - 
    4 - 
    5 - 
    6 - 
    7 - 
    8 - 
    9 -
 
 newInformation - Is there a tutorial screen before this level?
 
 informationText - What information will be displayed on the tutorial screen?
 
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.levels = [NSMutableArray alloc];
        Level *level1 = [[Level alloc] init];
        level1.levelName = @"Level 1";
        level1.inputMatrix = @[
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                               @0,@0,@0,@0,@0,@0,@0,@0,@0,@0
                               ];
        
        level1.outputMatrix = @[
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0,
                                @0,@0,@0,@0,@0,@0,@0,@0,@0,@0
                                ];
        
        level1.newInformation = true;
        
        level1.informationText = @"The goal of this game is to enable the output light using the input buttons. Tap an input button to see this in action!";
        
        [self.levels addObject:level1]; //index 0
        
    }
    return self;
}

@end
