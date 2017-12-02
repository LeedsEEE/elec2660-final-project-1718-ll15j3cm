//
//  SecondViewController.h
//  ELEC2660 Logic Game
//
//  Created by Johnny Mitchell on 23/11/2017.
//  Copyright © 2017 Johnny Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Level.h"
#import <AVFoundation/AVFoundation.h>

@interface LevelViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *levelName;
@property (strong, nonatomic) Level *level;
@property (strong, nonatomic) AVAudioPlayer *tone;
@property (strong, nonatomic) AVAudioPlayer *blop;
@property (strong, nonatomic) AVAudioPlayer *click;
@property (strong, nonatomic) AVAudioPlayer *whoosh;

@end

