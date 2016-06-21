//
//  PasswordViewController.m
//  TTPassword
//
//  Created by ttcloud on 16/6/20.
//  Copyright © 2016年 ttcloud. All rights reserved.
//

#import "PasswordViewController.h"
#import "TTConst.h"
@interface PasswordViewController ()

@end

@implementation PasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title =@"安全码设置";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [self addsubview];
    // Do any additional setup after loading the view.
}
-(void)addsubview
{
    
    
    self.label=[[UILabel alloc]initWithFrame:CGRectMake(0, 163.5, ScreenWidth, 16)];
    self.label.text=@"请设置安全码，以保障您的资金安全";
    self.label.textColor=UIColorFromRGB(0x3e3e3e);
    self.label.font=[UIFont systemFontOfSize:13];
    self.label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    self.secondtip=[[UILabel alloc]initWithFrame:CGRectMake(0,246, ScreenWidth, 16)];
    self.secondtip.text=@"请再次输入您的安全码";
    self.secondtip.textColor=UIColorFromRGB(0xff3674);
    self.secondtip.font=[UIFont systemFontOfSize:13];
    self.secondtip.textAlignment=NSTextAlignmentCenter;
    self.secondtip.hidden=YES;
    [self.view addSubview:self.secondtip];
    
    
    self.password = [[TTPasswordView alloc] initWithFrame:CGRectMake((ScreenWidth-256.5)/2, 193.5, 256.5, 39)];
    self.password.elementCount = 6;
    self.password.elementColor=UIColorFromRGB(0xd5d5d5);
    [self.view addSubview:self.password];
    __block PasswordViewController *weakself=self;
    self.password.passwordBlock = ^(NSString *password) {
        if (password.length==6) {
            [weakself enterCode:password];
        }
        
    };
    
    
}
-(void)enterCode:(NSString *)code
{
    
    if (!self.firstCode) {
        self.firstCode=code;
        self.secondtip.text=@"请再次输入您的安全码";
        self.secondtip.hidden=NO;
        [self.password clearText];
        [self.password.textField becomeFirstResponder];
    }
    else if (self.firstCode&&[self.firstCode isEqualToString:code])
    {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"密码匹配" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertController addAction:cancelAction];
        [self presentViewController:alertController animated:YES completion:nil];
        


    }
    else
    {
        self.secondtip.text=@"您两次输入的安全码不匹配，请重新设置";
        [self.password clearText];
        [self.password.textField becomeFirstResponder];
        self.firstCode=nil;
    }
    
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
