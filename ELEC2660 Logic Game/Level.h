//
//  Level.h
//  ELEC2660 Logic Game
//
//  Created by John Mitchell [ll15j3cm] on 24/11/2017.
//  Copyright © 2017 Johnny Mitchell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject

@property (strong, nonatomic) NSString *levelName;
@property (strong, nonatomic) NSNumber *levelNumber;
@property (strong, nonatomic) NSMutableArray *inputMatrix;
@property (strong, nonatomic) NSMutableArray *outputMatrix;
@property (strong, nonatomic) NSString *informationText;
@property int stars;
@property int taps;
@property int oneStarTaps;
@property int twoStarTaps;
@property int threeStarTaps;
@property Boolean newInformation;
@property Boolean complete;

@end
