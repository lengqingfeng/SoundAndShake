//
//  ViewController.m
//  SoundAndShake
//
//  Created by lengshengren on 13-10-22.
//  Copyright (c) 2013年 lengshengren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    /*
     ReceivedMessage.caf--收到信息，仅在短信界面打开时播放。
     sms-received1.caf-------三全音
     sms-received2.caf-------管钟琴
     sms-received3.caf-------玻璃
     sms-received4.caf-------圆号
     sms-received5.caf-------铃声
     sms-received6.caf-------电子乐
     SentMessage.caf--------发送信息
     
     邮件
     mail-sent.caf----发送邮件
     new-mail.caf-----收到新邮件
     
     */
    
    [self initSystemSoundWithName:@"sms-received5" SoundType:@"caf"];

	// Do any additional setup after loading the view, typically from a nib.
}


-(void)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType
{

        NSString *path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",soundName,soundType];
        //[[NSBundle bundleWithIdentifier:@"com.apple.UIKit" ]pathForResource:soundName ofType:soundType];//得到苹果框架资源UIKit.framework ，从中取出所要播放的系统声音的路径
        //[[NSBundle mainBundle] URLForResource: @"tap" withExtension: @"aif"];  获取自定义的声音
        if (path)
        {
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&systemsoundID);
            
            if (error != kAudioServicesNoError)
            {//获取的声音的时候，出现错误
                systemsoundID = 0;
            }
        }
}



- (IBAction)playSound:(id)sender
{
    [self play];
}



  


- (void)play
{
    AudioServicesPlaySystemSound(systemsoundID);
}

-(void)shake
{
    systemshake = kSystemSoundID_Vibrate;//震动
    AudioServicesPlaySystemSound(systemshake);
}

- (IBAction)playAndShake:(id)sender
{
    [self play];
    [self shake];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shake:(id)sender
{
    [self shake];
}
@end
