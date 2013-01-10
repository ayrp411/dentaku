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

- (void)NUMBER:(int)number;//数値入力をまとめた
- (void)ENZAN:(int)enzan;//演算子を押したときの処理をまとめた
- (void)ZERO:(int)zero;//０と００を押したときの処理をまとめた
- (void)CLEAR;//


- (IBAction)zero:(id)sender;//0
- (IBAction)zerozero:(id)sender;//00
- (IBAction)ten:(id)sender;//.
- (IBAction)puramai:(id)sender;//±
- (IBAction)clear:(id)sender;//C
- (IBAction)AllClear:(id)sender;//AC
- (IBAction)one:(id)sender;//1
- (IBAction)two:(id)sender;//2
- (IBAction)three:(id)sender;//3
- (IBAction)yon:(id)sender;//4
- (IBAction)five:(id)sender;//5
- (IBAction)six:(id)sender;//6
- (IBAction)seven:(id)sender;//7
- (IBAction)eight:(id)sender;//8
- (IBAction)nine:(id)sender;//9
- (IBAction)tasu:(id)sender;//+
- (IBAction)hiku:(id)sender;//-
- (IBAction)kake:(id)sender;//×
- (IBAction)waru:(id)sender;//÷
- (IBAction)enter:(id)sender;//=
- (IBAction)root:(id)sender;//√
- (IBAction)sin:(id)sender;
- (IBAction)cos:(id)sender;
- (IBAction)tan:(id)sender;


@end
