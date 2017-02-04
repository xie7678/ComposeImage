//
//  SecViewController.m
//  ComposeImage
//
//  Created by Sam on 17/2/4.
//  Copyright © 2017年 Sam. All rights reserved.
//

#import "SecViewController.h"
#import "UIImage+Composition.h"
@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)show:(UIButton *)sender {
    //计算label与image的相对位置
    CGFloat x = (self.label.frame.origin.x - self.firstImg.frame.origin.x)/self.firstImg.frame.size.width;
    CGFloat y = (self.label.frame.origin.y - self.firstImg.frame.origin.y)/self.firstImg.frame.size.height;
    self.showImg.image = [self.firstImg.image compositionWithLabel:self.label labelOfImgWithX:x labelOfImgWithY:y fontWithColor:[UIColor redColor]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    self.label.text = textField.text;
    [self.view endEditing:YES];
    return YES;
}
- (IBAction)labelP:(UIPanGestureRecognizer *)sender {
    [sender.view.superview bringSubviewToFront:sender.view];
    CGPoint center = sender.view.center;
    CGPoint translation = [sender translationInView:self.view];
    sender.view.center = CGPointMake(center.x + translation.x, center.y + translation.y);
    [sender setTranslation:CGPointZero inView:self.view];
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
