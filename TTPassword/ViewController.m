//
//  ViewController.m
//  TTPassword
//
//  Created by ttcloud on 16/6/20.
//  Copyright © 2016年 ttcloud. All rights reserved.
//

#import "ViewController.h"
#import "PopPasswordView.h"
#import "PasswordViewController.h"
#import "TTConst.h"


@interface ViewController ()
{
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubviews];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addSubviews
{
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake((ScreenWidth-100)/2, 100, 100, 50);
    btn1.layer.borderColor=UIColorFromRGB(0xff3674).CGColor;
    btn1.layer.borderWidth=1;
    [btn1 setTitle:@"弹出密码框" forState:UIControlStateNormal];
    [btn1 setTitleColor:UIColorFromRGB(0xff3674) forState:UIControlStateNormal];
    btn1.titleLabel.font=[UIFont systemFontOfSize:10];
    btn1.titleLabel.textAlignment=NSTextAlignmentCenter;
    btn1.tag=1;
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake((ScreenWidth-100)/2, 200, 100, 50);
    btn2.layer.borderColor=[UIColor greenColor].CGColor;
    btn2.layer.borderWidth=1;
    [btn2 setTitle:@"设置密码框界面" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn2.titleLabel.font=[UIFont systemFontOfSize:10];
    btn2.tag=2;
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}
-(void)btnAction:(UIButton *)btn
{
    if (btn.tag==1) {
        self.passwordView=[[PopPasswordView alloc]initViewwithtype:@"open"];
        self.passwordView.delegate=self;
        self.passwordView.type=@"open";
        [[UIApplication sharedApplication].keyWindow addSubview:self.passwordView];
    }
    else if (btn.tag==2)
    {
        [self presentViewController:[PasswordViewController alloc] animated:YES completion:nil];
    }
}
-(void)useStoreCode:(NSString *)code
{
   
        [self.passwordView removeFromSuperview];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"您输入的密码为:%@",code] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
       
    }];
    [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
    

}
-(void)disAction
{
    [self.passwordView removeFromSuperview];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
