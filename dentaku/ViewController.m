//
//  ViewController.m
//  dentaku
//
//  Created by 天野　良紀 on 12/10/16.
//  Copyright (c) 2012年 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

double n=0;//入力値
double c=0;//計算値
double x=0;//計算結果
int F=0;//演算子フラグ
int E=0;//クリアフラグ
int f=0;//小数点フラグ
int pm=0;//±フラグ

/////////数字を入力////////
- (void)NUMBER:(int)number {
    NSLog(@"入力");
    if(f!=0){//小数点が押されていない
        if(F>=10){//＝が押された
            n=number;//数値入力
            F=0;
            f=0;
            x=0;
            [[self label2] setText:@""];
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
                [[self label2] setText:@""];
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
    [[self label1] setText:[NSString stringWithFormat : @"%g",n]];
}
//////////0か00が押された////////////////
- (void)ZERO:(int)zero{

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
                [[self label2] setText:@""];
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
    [[self label1] setText:[NSString stringWithFormat : @"%g",n]];
}
//////////演算子が押された///////////////
- (void)ENZAN:(int)enzan{
 
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
    [[self label1] setText:[NSString stringWithFormat : @"%g",n]];
    [[self label3] setText:@""];
    F=enzan;
    E=0;//Clearフラグ
    f=0;//小数点フラグ
    pm=0;
}
//////////////0か00を押したとき////////////////////
- (IBAction)zero:(id)sender {//0のとき
    NSLog(@"０_push");
    [self ZERO:1];
}
- (IBAction)zerozero:(id)sender {//00のとき
    NSLog(@"００_push");
    [self ZERO:2];
}
////////////小数点を押したとき//////////////
- (IBAction)ten:(id)sender {
    NSLog(@"ten_push");
    if(f==0){
        if(F>=10){
            n=0;
            F=0;
            x=0;
            [[self label2] setText:@""];
        }
        NSLog(@"tenten_push");
        [[self label1] setText:[NSString stringWithFormat : @"%g.",n]];
        f=1;
    }
}
////////////±を押したとき/////////ここははっきり言っておかしい////////
- (IBAction)puramai:(id)sender {
    
    if(n!=0)
    {
        n=(-1)*n;
        [[self label1] setText:[NSString stringWithFormat : @"%g",n]];
        pm=2;
        NSLog(@"±_push");
    }
    if(n==0){
        [[self label1] setText:@"-"];
        pm=1;
        NSLog(@"±_pussyu");
    }
    else{
        if(F>=10){
            x=0-x;
            [[self label1] setText:[NSString stringWithFormat : @"%g",x]];
            n=x;
            NSLog(@"±_ぷっしゅ");
        }
    }        
}
/////////////clearを押したとき//////////
- (IBAction)clear:(id)sender {
    NSLog(@"clear_push");
    if(F!=0){//演算子が押されたあとのクリア
        E=1;
        [[self label2] setText:[NSString stringWithFormat : @"%g",c]];
        [[self label3] setText:@"Clear"];
    }
    else{//演算子が押される前のクリア
        [self CLEAR];
    }
    n=0;
    F=0;
    x=0;
    pm=0;
    [[self label1] setText:[NSString stringWithFormat : @"%g",n]];
}
/////////////All Clearを押したとき//////////////
- (IBAction)AllClear:(id)sender {
    [self CLEAR];
}
//////////////All Clear////////////////////
- (void)CLEAR{    
    [[self label3] setText:@"All Clear"];
    [[self label2] setText:@""];
    n=0;
    c=0;
    F=0;
    E=0;
    f=0;
    x=0;
    pm=0;
    [[self label1] setText:[NSString stringWithFormat : @"%g",n]];    
}
//////////////数字ボタンを押したとき/////////////
- (IBAction)one:(id)sender {
    NSLog(@"１_push");
    [self NUMBER:1];
}
- (IBAction)two:(id)sender {
    NSLog(@"２_push");
    [self NUMBER:2];
}
- (IBAction)three:(id)sender {
    NSLog(@"３_push");
    [self NUMBER:3];
}
- (IBAction)yon:(id)sender {
    NSLog(@"４_push");
    [self NUMBER:4];
}
- (IBAction)five:(id)sender {
    NSLog(@"５_push");
    [self NUMBER:5];
}
- (IBAction)six:(id)sender {
    NSLog(@"６_push");
    [self NUMBER:6];
}
- (IBAction)seven:(id)sender {
    NSLog(@"７_push");
    [self NUMBER:7];
}
- (IBAction)eight:(id)sender {
    NSLog(@"８_push");
    [self NUMBER:8];
}
- (IBAction)nine:(id)sender {
    NSLog(@"９_push");
    [self NUMBER:9];
}
//////////////演算子を押したとき/////////////
- (IBAction)tasu:(id)sender {
    NSLog(@"＋_push");
    [self ENZAN:1];
    [[self label2] setText:[NSString stringWithFormat : @"%g +",c]];
}
- (IBAction)hiku:(id)sender {
    NSLog(@"ー_push");
    [self ENZAN:2];
    [[self label2] setText:[NSString stringWithFormat : @"%g -",c]];
}
- (IBAction)kake:(id)sender {
    NSLog(@"×_push");
    [self ENZAN:3];
    [[self label2] setText:[NSString stringWithFormat : @"%g ×",c]];
}
- (IBAction)waru:(id)sender {
    NSLog(@"÷_push");
    [self ENZAN:4];
    [[self label2] setText:[NSString stringWithFormat : @"%g ÷",c]];
}
//////////////＝を押したとき/////////////
- (IBAction)enter:(id)sender {
    NSLog(@"＝_push");
    [[self label3] setText:@""];
    switch(F){
        case 1:
            [[self label2] setText:[NSString stringWithFormat : @"%g + %g",c,n]];
            x=c+n;
            F=F+10;
            break;

        case 2:
            [[self label2] setText:[NSString stringWithFormat : @"%g - %g",c,n]];
            x=c-n;
            F=F+10;
            break;
            
        case 3:
            [[self label2] setText:[NSString stringWithFormat : @"%g × %g",c,n]];
            x=c*n;
            F=F+10;
            break;
            
        case 4:
            if(n==0){
                [[self label3] setText:@"Error"];
                [[self label2] setText:[NSString stringWithFormat : @"%g ÷ %g",c,n]];
                [[self label1] setText:@"error"];
            }
            else{
                [[self label2] setText:[NSString stringWithFormat : @"%g ÷ %g",c,n]];
                x=c/n;
                F=F+10;
            }
            break;
            /////=連打で演算を続ける作業//////
        case 11:
            c=x;
            [[self label2] setText:[NSString stringWithFormat : @"%g + %g",c,n]];
            x=c+n;
            break;
            
        case 12:
            c=x;
            [[self label2] setText:[NSString stringWithFormat : @"%g - %g",c,n]];
            x=c-n;
            break;
            
        case 13:
            c=x;
            [[self label2] setText:[NSString stringWithFormat : @"%g × %g",c,n]];
            x=c*n;
            break;
            
        case 14:
            c=x;
            if(n==0){
                [[self label3] setText:@"Error"];
                [[self label2] setText:[NSString stringWithFormat : @"%g ÷ %g",c,n]];
                [[self label1] setText:@"error"];
            }
            else{
                [[self label2] setText:[NSString stringWithFormat : @"%g ÷ %g",c,n]];
                x=c/n;
            }
            break;
    }
    [[self label1] setText:[NSString stringWithFormat : @"= %g",x]];
}
////////////√を押したとき//////////////
- (IBAction)root:(id)sender {
    if(F>=10){
        [[self label2] setText:[NSString stringWithFormat : @"√(%f)",x]];
        x=sqrt(x);
        [[self label1] setText:[NSString stringWithFormat : @"= %f",x]];
    }
    else{
        [[self label2] setText:[NSString stringWithFormat : @"√(%f)",n]];
        n=sqrt(n);
        [[self label1] setText:[NSString stringWithFormat : @"= %f",n]];
    }
}
////////////sinを押したとき//////////////
- (IBAction)sin:(id)sender {
    if(F>=10){
        [[self label2] setText:[NSString stringWithFormat : @"sin(%f)",x]];
        x=sin(x*(2*M_PI)/360);
        [[self label1] setText:[NSString stringWithFormat : @"= %f",x]];
    }
    else{
        [[self label2] setText:[NSString stringWithFormat : @"sin(%f)",n]];
        n=sin(n*(2*M_PI)/360);
        [[self label1] setText:[NSString stringWithFormat : @"= %f",n]];
    }
}
////////////cosを押したとき//////////////
- (IBAction)cos:(id)sender {
    if(F>=10){
        [[self label2] setText:[NSString stringWithFormat : @"cos(%f)",x]];
        x=cos(x*(2*M_PI)/360);
        [[self label1] setText:[NSString stringWithFormat : @"= %f",x]];
    }
    else{
        [[self label2] setText:[NSString stringWithFormat : @"cos(%f)",n]];
        n=cos(n*(2*M_PI)/360);
        [[self label1] setText:[NSString stringWithFormat : @"= %f",n]];
    }
}
////////////tanを押したとき//////////////
- (IBAction)tan:(id)sender {
    if(F>=10){
        [[self label2] setText:[NSString stringWithFormat : @"tan(%f)",x]];
        x=tan(x*(2*M_PI)/360);
        [[self label1] setText:[NSString stringWithFormat : @"= %f",x]];
    }
    else{
        [[self label2] setText:[NSString stringWithFormat : @"tan(%f)",n]];
        n=tan(n*(2*M_PI)/360);
        [[self label1] setText:[NSString stringWithFormat : @"= %f",n]];
    }
}
@end
