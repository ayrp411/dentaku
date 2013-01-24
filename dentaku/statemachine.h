//
//  statemachine.h
//  dentaku
//
//  Created by 天野　良紀 on 13/01/17.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ViewController;

@interface statemachine : NSObject{
    
    
}


- (void)NUMBER:(int)number controller:(ViewController*)controller;//数値入力をまとめた
- (void)ZERO:(int)zero controller:(ViewController*)controller;//０と００を押したときの処理をまとめた
- (void)ENZAN:(int)enzan controller:(ViewController*)controller;//演算子を押したときの処理をまとめた
- (void)CLEAR:(ViewController*)controller;//
////////////////////////////////
- (void)zero:(id)sender controller:(ViewController*)controller;//0
- (void)zerozero:(id)sender controller:(ViewController*)controller;//00
- (void)ten:(id)sender controller:(ViewController*)controller;//.
- (void)puramai:(id)sender controller:(ViewController*)controller;//±
- (void)clear:(id)sender controller:(ViewController*)controller;//C
- (void)AllClear:(id)sender controller:(ViewController*)controller;//AC
- (void)one:(id)sender controller:(ViewController*)controller;//1
- (void)two:(id)sender controller:(ViewController*)controller;//2
- (void)three:(id)sender controller:(ViewController*)controller;//3
- (void)yon:(id)sender controller:(ViewController*)controller;//4
- (void)five:(id)sender controller:(ViewController*)controller;//5
- (void)six:(id)sender controller:(ViewController*)controller;//6
- (void)seven:(id)sender controller:(ViewController*)controller;//7
- (void)eight:(id)sender controller:(ViewController*)controller;//8
- (void)nine:(id)sender controller:(ViewController*)controller;//9
- (void)tasu:(id)sender controller:(ViewController*)controller;//+
- (void)hiku:(id)sender controller:(ViewController*)controller;//-
- (void)kake:(id)sender controller:(ViewController*)controller;//×
- (void)waru:(id)sender controller:(ViewController*)controller;//÷
- (void)enter:(id)sender controller:(ViewController*)controller;//=
- (void)root:(id)sender controller:(ViewController*)controller;//√
- (void)sin:(id)sender controller:(ViewController*)controller;//sin
- (void)cos:(id)sender controller:(ViewController*)controller;//cos
- (void)tan:(id)sender controller:(ViewController*)controller;//tan
- (void)pi:(id)sender controller:(ViewController*)controller;//π

@end
