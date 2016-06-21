//
//  PopPasswordView.m
//  TTPassword
//
//  Created by ttcloud on 16/6/20.
//  Copyright © 2016年 ttcloud. All rights reserved.
//

#import "PopPasswordView.h"
#import "TTConst.h"
@implementation PopPasswordView

-(id)initViewwithtype:(NSString *)type
{
    self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight+64)];
    if(self)
    {
        //        self.backgroundColor=UIColorFromRGB(0x000000);
        UIView *view0=[[UIView alloc]initWithFrame:self.frame];
        view0.backgroundColor=UIColorFromRGB(0x000000);
        view0.alpha=0.5;
        [self addSubview:view0];
        
        UIButton *disbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        disbtn.frame=CGRectMake(ScreenWidth-48, 74, 24, 24);
        [disbtn setBackgroundImage:[UIImage imageNamed:@"关闭.png"] forState:UIControlStateNormal];
        disbtn.contentMode=UIViewContentModeScaleAspectFit;
        [disbtn addTarget:self action:@selector(disbtnAction) forControlEvents:UIControlEventTouchUpInside];
        [view0 addSubview:disbtn];
        
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake((ScreenWidth-276)/2, 270, 276, 158)];
        view.layer.cornerRadius=11;
        view.backgroundColor=[UIColor whiteColor];
        [self addSubview:view];
        self.tip=[[UILabel alloc]initWithFrame:CGRectMake(0, 27, view.frame.size.width, 17)];
        self.tip.font=[UIFont systemFontOfSize:14];
        self.tip.textColor=UIColorFromRGB(0x000000);
        self.tip.textAlignment=NSTextAlignmentCenter;
        [view addSubview: self.tip];
        self.password = [[TTPasswordView alloc] initWithFrame:CGRectMake((view.frame.size.width-256)/2, 93, 256, 37)];
        self.password.textField.keyboardType=UIKeyboardTypeASCIICapable;
        self.password.elementCount = 6;
        self.password.elementColor=UIColorFromRGB(0xd5d5d5);
        [view addSubview:self.password];
        if ([type isEqualToString:@"open"]) {
            self.tip.text=@"请输入仓库激活码";
            self.password.textField.secureTextEntry=NO;
            [self.password setNoSecure];
        }
        else
        {
            self.tip.text=@"请输入安全码";
        }
        __weak PopPasswordView *weakself = self;
        self.password.passwordBlock = ^(NSString *password) {
            if (password.length==6) {
                if (self.delegate&&[self.delegate respondsToSelector:@selector(useStoreCode:)]) {
                    [weakself.delegate useStoreCode:password];
                }
            }
        };
        
    }
    return self;
}
-(void)disbtnAction
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(disAction)]) {
        [self.delegate disAction];
    }
    
}
-(void)failPassword:(NSNumber *)number
{
    NSString *str=[NSString stringWithFormat:@"密码错误，您还有%@次机会",number];
    self.tip.text=str;
    self.tip.textColor=UIColorFromRGB(0xff3674);
    [self.password clearText];
    
}
@end

