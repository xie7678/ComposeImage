//
//  SecViewController.h
//  ComposeImage
//
//  Created by Sam on 17/2/4.
//  Copyright © 2017年 Sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *firstImg;

@property (weak, nonatomic) IBOutlet UIView *firstView;

@property (weak, nonatomic) IBOutlet UIView *secView;


@property (weak, nonatomic) IBOutlet UIImageView *showImg;


@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *strTF;

@end
