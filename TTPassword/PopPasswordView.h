//
//  PopPasswordView.h
//  TTPassword
//
//  Created by ttcloud on 16/6/20.
//  Copyright © 2016年 ttcloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTPasswordView.h"
@protocol PopPasswordViewDelegate<NSObject>
/**
 *  输入密码回调
 *
 *  @param code 密码
 */
-(void)useStoreCode:(NSString *)code;
/**
 *  取消密码框
 */
-(void)disAction;
@end
/**
 *  弹出的密码框
 */
@interface PopPasswordView : UIView
@property(nonatomic,assign)id<PopPasswordViewDelegate>delegate;
/**
 *  判断来源类型，备用
 */
@property(nonatomic,retain)NSString *type;
/**
 *  密码框，用来方便控制其内容是否清空
 */
@property(nonatomic,retain)TTPasswordView *password;

/**
 *  用来显示内容
 */
@property(nonatomic,retain)UILabel *tip;

-(id)initViewwithtype:(NSString *)type;
/**
 *  密码错误处理
 *
 *  @param number 剩余机会数
 */
-(void)failPassword:(NSNumber *)number;

@end
