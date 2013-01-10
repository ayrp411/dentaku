//
//  ViewController.h
//  dentaku
//
//  Created by 天野　良紀 on 12/10/16.
//  Copyright (c) 2012年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;

- (void)NUMBER:(int)number;
- (void)ENZAN:(int)enzan;
- (void)ZERO:(int)zero;
- (void)CLEAR;


- (IBAction)zero:(id)sender;
- (IBAction)zerozero:(id)sender;
- (IBAction)ten:(id)sender;
- (IBAction)puramai:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)AllClear:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)yon:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;
- (IBAction)tasu:(id)sender;
- (IBAction)hiku:(id)sender;
- (IBAction)kake:(id)sender;
- (IBAction)waru:(id)sender;
- (IBAction)enter:(id)sender;


@end
