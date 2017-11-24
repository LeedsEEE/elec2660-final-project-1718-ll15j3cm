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
@property (strong, nonatomic) NSArray *inputMatrix;
@property (strong, nonatomic) NSArray *outputMatrix;
@property (strong, nonatomic) NSString *informationText;
@property Boolean newInformation;
@property Boolean complete;

@end
