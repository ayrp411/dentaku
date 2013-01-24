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
@synthesize model;

- (void)viewDidLoad
{
    [super viewDidLoad];
    model = [[statemachine alloc] init];
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
int pi=0;//πのフラグ

/////////ラベルの表示形式は以下の通りである/////////
- (void)setTextlabel1n{
    [[self label1] setText:[NSString stringWithFormat : @"%g",n]];
}
- (void)setTextlabel1x{
    [[self label1] setText:[NSString stringWithFormat : @"%g",x]];
}
- (void)setTextlabel1m{
    [[self label1] setText:@"-"];
}
- (void)setTextlabel1E{
    [[self label1] setText:@"error"];
}
- (void)setTextlabel1EQx{
    [[self label1] setText:[NSString stringWithFormat : @"= %g",x]];
}
- (void)setTextlabel2{
    [[self label2] setText:@""];
}
- (void)setTextlabel2c{
    [[self label2] setText:[NSString stringWithFormat : @"%g",c]];
}
- (void)setTextlabel2pc{
    [[self label2] setText:[NSString stringWithFormat : @"%g +",c]];
}
- (void)setTextlabel2mc{
    [[self label2] setText:[NSString stringWithFormat : @"%g -",c]];
}
- (void)setTextlabel2kc{
    [[self label2] setText:[NSString stringWithFormat : @"%g ×",c]];
}
- (void)setTextlabel2wc{
    [[self label2] setText:[NSString stringWithFormat : @"%g ÷",c]];
}
- (void)setTextlabel2cpn{
    [[self label2] setText:[NSString stringWithFormat : @"%g + %g",c,n]];
}
- (void)setTextlabel2cmn{
    [[self label2] setText:[NSString stringWithFormat : @"%g - %g",c,n]];
}
- (void)setTextlabel2ckn{
    [[self label2] setText:[NSString stringWithFormat : @"%g × %g",c,n]];
}
- (void)setTextlabel2cwn{
    [[self label2] setText:[NSString stringWithFormat : @"%g ÷ %g",c,n]];
}
- (void)setTextlabel3{
    [[self label3] setText:@""];
}
- (void)setTextlabel3C{
    [[self label3] setText:@"Clear"];
}
- (void)setTextlabel3AC{
    [[self label3] setText:@"All Clear"];
}
- (void)setTextlabel3E{
    [[self label3] setText:@"Error"];
}
///////////////数字を入力//////////////////////
- (void)NUMBER:(int)number {               //
    [model NUMBER:number controller:self];//
}                                          //
//////////0か00が押された//////////////////////
- (void)ZERO:(int)zero{                   //
    [model ZERO:zero controller:self];   //
}                                         //
//////////演算子が押された//////////////////////
- (void)ENZAN:(int)enzan{                  //
    [model ENZAN:enzan controller:self];  //
}                                          //
//////////////0か00を押したとき////////////////
- (IBAction)zero:(id)sender {//0のとき
    NSLog(@"０_push");
    [self ZERO:1];
    //[model zero:sender controller:self];
}
- (IBAction)zerozero:(id)sender {//00のとき
    NSLog(@"００_push");
    [self ZERO:2];
}
////////////小数点を押したとき///////////////////
- (IBAction)ten:(id)sender {               //
    [model ten:sender controller:self];   //
}                                          //
////////////±を押したとき////////////////////////
- (IBAction)puramai:(id)sender {            //
    [model puramai:sender controller:self];//
}                                           //
/////////////clearを押したとき//////////////////
- (IBAction)clear:(id)sender {              //
    [model clear:sender controller:self];  //
}                                           //
/////////////All Clearを押したとき//////////////
- (IBAction)AllClear:(id)sender {
    [model CLEAR:self];
}
//////////////All Clear////////////////////
- (void)CLEAR{                           //
    [model CLEAR:self];                 //
}                                        //
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
    [self setTextlabel2pc];
}
- (IBAction)hiku:(id)sender {
    NSLog(@"ー_push");
    [self ENZAN:2];
    [self setTextlabel2mc];
}
- (IBAction)kake:(id)sender {
    NSLog(@"×_push");
    [self ENZAN:3];
    [self setTextlabel2kc];
}
- (IBAction)waru:(id)sender {
    NSLog(@"÷_push");
    [self ENZAN:4];
    [self setTextlabel2wc];
}
//////////////＝を押したとき/////////////////////
- (IBAction)enter:(id)sender {              //
    [model enter:sender controller:self];  //
}                                           //
////////////√を押したとき///////////////////////
- (IBAction)root:(id)sender {              //
    [model root:sender controller:self];  //
}                                          //
////////////sinを押したとき////////////////////
- (IBAction)sin:(id)sender {              //
    [model sin:sender controller:self];  //
}                                         //
////////////cosを押したとき////////////////////
- (IBAction)cos:(id)sender {              //
    [model cos:sender controller:self];  //
}                                         //
////////////tanを押したとき///////////////////
- (IBAction)tan:(id)sender {             //
    [model tan:sender controller:self]; //
}                                        //
////////////πを押したとき////////////////////
- (IBAction)pi:(id)sender {
    [model pi:sender controller:self];
}
@end
