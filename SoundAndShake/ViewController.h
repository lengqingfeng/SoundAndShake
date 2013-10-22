//
//  ViewController.h
//  SoundAndShake
//
//  Created by lengshengren on 13-10-22.
//  Copyright (c) 2013年 lengshengren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController
{
    SystemSoundID systemsoundID ,systemshake;  //系统声音ID
}
- (IBAction)playSound:(id)sender;
- (IBAction)shake:(id)sender; //震动
- (IBAction)playAndShake:(id)sender;
-(void)shake;//系统 震动
-(void)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;//初始化系统声音
- (void)play; //播放



@end
