//
//  PasswordViewController.h
//  TTPassword
//
//  Created by ttcloud on 16/6/20.
//  Copyright © 2016年 ttcloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTPasswordView.h"
@interface PasswordViewController : UIViewController
/**
 *  请您设置仓库提示的label
 */
@property(nonatomic,retain)UILabel *label;
/**
 *  请再次输入密码的提示
 */
@property(nonatomic,retain)UILabel *secondtip;
/**
 *   密码框
 */
@property(nonatomic,retain)TTPasswordView *password;
/**
 *  第一次输入的密码
 */
@property(nonatomic,copy)NSString *firstCode;


/**
 *  判断入口类型:备用
 */
@property(nonatomic,copy)NSString *enterType;
@end
