//
//  ViewController.h
//  TTPassword
//
//  Created by ttcloud on 16/6/20.
//  Copyright © 2016年 ttcloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopPasswordView.h"
@interface ViewController : UIViewController<PopPasswordViewDelegate>
@property(nonatomic,retain)PopPasswordView *passwordView;

@end

