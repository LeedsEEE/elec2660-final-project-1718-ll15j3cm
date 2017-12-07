//
//  FirstViewController.h
//  ELEC2660 Logic Game
//
//  Created by Johnny Mitchell on 23/11/2017.
//  Copyright © 2017 Johnny Mitchell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

- (IBAction)clearData:(UIButton *)sender;

@end

