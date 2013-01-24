//
//  statemachine.m
//  dentaku
//
//  Created by 天野　良紀 on 13/01/17.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "statemachine.h"
#import "ViewController.h"

@implementation statemachine

double n;//入力値
double c;//計算値
double x;//計算結果
int F;//演算子フラグ
int E;//クリアフラグ
int f;//小数点フラグ
int pm;//±フラグ
int pi;//πのフラグ


/////////数字を入力////////
- (void)NUMBER:(int)number controller:(ViewController*)controller{
    NSLog(@"入力");
    if(f!=0){//小数点が押されていない
        if(F>=10){//＝が押された
            n=number;//数値入力
            F=0;//演算子のフラグ
            f=0;//小数点のフラグ
            x=0;//計算結果
            [controller setTextlabel2];
        }
        else{//小数点が押されている
            if(pm==1){//±が押されている
                n=n-number*pow(0.1,f);
            }
            else{
                n=n+number*pow(0.1,f);
            }
            f=f+1;
        }
    }
    else{
        if(n==0){
            if(pm==1){//±が押された
                n=(-1)*number;
            }
            else{
                n=number;
            }
        }
        else{
            if(F>=10){//＝が押された
                n=number;
                F=0;
                x=0;
                [controller setTextlabel2];
            }
            else{
                if(pm==1){
                    n=n*10+(-1)*number;
                }
                else{
                    n=n*10+number;
                }
            }
        }
    }
    [controller setTextlabel1n];
}
//////////0か00が押された////////////////
- (void)ZERO:(int)zero controller:(ViewController*)controller{
    
    if(f!=0){
        if(zero==1){
            f=f+1;
        }
        if(zero==2){
            f=f+2;
        }
    }
    else{
        if(n!=0){
            if(F>=10){
                n=0;
                F=0;
                x=0;
                [controller setTextlabel2];
            }
            else{
                if(zero==1){
                    n=n*10;
                }
                if(zero==2){
                    n=n*100;
                }
            }
        }
    }
    [controller setTextlabel1n];
}
//////////演算子が押された///////////////
- (void)ENZAN:(int)enzan controller:(ViewController*)controller{
    
    if(E!=1){//clearが１回押されなかった
        if(F==0){
            c=n;
        }
        else{
            if(pm==2){
                c=n;
            }
            else if(F>=10){
                c=x;
                NSLog(@"えんざん_push");
            }
        }
    }
    n=0;
    [controller setTextlabel1n];
    [controller setTextlabel3];
    F=enzan;
    E=0;//Clearフラグ
    f=0;//小数点フラグ
    pm=0;
}
//////////////All Clear////////////////////
- (void)CLEAR:(ViewController*)controller;{
    [controller setTextlabel3AC];
    [controller setTextlabel2];
    n=0;
    c=0;
    F=0;
    E=0;
    f=0;
    x=0;
    pm=0;
    pi=0;
    [controller setTextlabel1n];
}
////////////小数点を押したとき//////////////
- (void)ten:(id)sender controller:(ViewController*)controller{
    NSLog(@"ten_push");
    if(f==0){
        if(F>=10){
            n=0;
            F=0;
            x=0;
            [controller setTextlabel2];
        }
        NSLog(@"tenten_push");
        [controller setTextlabel1n];
        f=1;
    }
}
////////////±を押したとき/////////////////
- (void)puramai:(id)sender controller:(ViewController*)controller {
    
    if(n!=0)
    {
        n=(-1)*n;
        [controller setTextlabel1n];
        pm=2;
        NSLog(@"±_push");
    }
    if(n==0){
        [controller setTextlabel1m];
        pm=1;
        NSLog(@"±_pussyu");
    }
    else{
        if(F>=10){
            x=0-x;
            [controller setTextlabel1x];
            n=x;
            NSLog(@"±_ぷっしゅ");
        }
    }
}
/////////////clearを押したとき//////////////////
- (void)clear:(id)sender controller:(ViewController*)controller {
    NSLog(@"clear_push");
    if(F!=0){//演算子が押されたあとのクリア
        E=1;
        [controller setTextlabel2c];
        [controller setTextlabel3C];
    }
    else{//演算子が押される前のクリア
        [controller CLEAR];
    }
    n=0;
    F=0;
    x=0;
    pm=0;
    [controller setTextlabel1n];
}
//////////////＝を押したとき/////////////
- (void)enter:(id)sender controller:(ViewController*)controller {
    NSLog(@"＝_push");
    [controller setTextlabel3];
    switch(F){
        case 1:
            [controller setTextlabel2cpn];
            x=c+n;
            F=F+10;
            break;
            
        case 2:
            [controller setTextlabel2cmn];
            x=c-n;
            F=F+10;
            break;
            
        case 3:
            [controller setTextlabel2ckn];
            x=c*n;
            F=F+10;
            break;
            
        case 4:
            if(n==0){
                [controller setTextlabel3E];
                [controller setTextlabel2cwn];
                [controller setTextlabel1E];
            }
            else{
                [controller setTextlabel2cwn];
                x=c/n;
                F=F+10;
            }
            break;
            /////=連打で演算を続ける作業//////
        case 11:
            c=x;
            [controller setTextlabel3];
            x=c+n;
            break;
            
        case 12:
            c=x;
            [controller setTextlabel2cpn];
            x=c-n;
            break;
            
        case 13:
            c=x;
            [controller setTextlabel2ckn];
            x=c*n;
            break;
            
        case 14:
            c=x;
            if(n==0){
                [controller setTextlabel3E];
                [controller setTextlabel2cwn];
                [controller setTextlabel1E];
            }
            else{
                [controller setTextlabel2cwn];
                x=c/n;
            }
            break;
    }
    [controller setTextlabel1EQx];
}
////////////√を押したとき//////////////
- (void)root:(id)sender controller:(ViewController*)controller{
    if(F>=10){
        [[controller label2] setText:[NSString stringWithFormat : @"√(%f)",x]];
        x=sqrt(x);
        [[controller label1] setText:[NSString stringWithFormat : @"= %f",x]];
    }
    else{
        [[controller label2] setText:[NSString stringWithFormat : @"√(%f)",n]];
        n=sqrt(n);
        [[controller label1] setText:[NSString stringWithFormat : @"= %f",n]];
    }
}
////////////sinを押したとき//////////////
- (void)sin:(id)sender controller:(ViewController*)controller{
    if(F>=10){
        if(pi==1){
            [[controller label2] setText:[NSString stringWithFormat : @"sin(%fπ)",x]];
            x=sin(x*M_PI);
        }
        [[controller label2] setText:[NSString stringWithFormat : @"sin(%f)",x]];
        x=sin(x);
        [[controller label1] setText:[NSString stringWithFormat : @"= %f",x]];
    }
    else{
        if(pi==1){
            [[controller label2] setText:[NSString stringWithFormat : @"sin(%fπ)",n]];
            x=sin(n*M_PI);
        }
        [[controller label2] setText:[NSString stringWithFormat : @"sin(%f)",n]];
        n=sin(n);
        [[controller label1] setText:[NSString stringWithFormat : @"= %f",n]];
    }
}
////////////cosを押したとき//////////////
- (void)cos:(id)sender controller:(ViewController*)controller{
    if(F>=10){
        [[controller label2] setText:[NSString stringWithFormat : @"cos(%f)",x]];
        x=cos(x);
        [[controller label1] setText:[NSString stringWithFormat : @"= %f",x]];
    }
    else{
        [[controller label2] setText:[NSString stringWithFormat : @"cos(%f)",n]];
        n=cos(n);
        [[controller label1] setText:[NSString stringWithFormat : @"= %f",n]];
    }
}
////////////tanを押したとき//////////////
- (void)tan:(id)sender controller:(ViewController*)controller{
    if(F>=10){
        [[controller label2] setText:[NSString stringWithFormat : @"tan(%f)",x]];
        x=tan(x);
        [[controller label1] setText:[NSString stringWithFormat : @"= %f",x]];
    }
    else{
        [[controller label2] setText:[NSString stringWithFormat : @"tan(%f)",n]];
        n=tan(n);
        [[controller label1] setText:[NSString stringWithFormat : @"= %f",n]];
    }
}
////////////πを押したとき///////////////////πは試験後に実装///////
- (void)pi:(id)sender controller:(ViewController *)controller{
    if(F>=10){
        [[controller label1] setText:[NSString stringWithFormat : @"%gπ",x]];
    }
    else{
        if(F==0){
            [[controller label1] setText:@"π"];
        }
        else{
            [[controller label1] setText:[NSString stringWithFormat : @"%gπ",n]];
        }
    }
    pi=1;
}


@end
