//
//  SecViewController.m
//  ComposeImage
//
//  Created by Sam on 17/2/4.
//  Copyright © 2017年 Sam. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)show:(UIButton *)sender {
    self.showImg.image = [self createShareImage:self.label.text name:self.firstImg.image];
}
- (IBAction)add:(UIButton *)sender {
    
//    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
//    
//    _label.text = @"添加文字";
//    
//    [_firstImg addSubview:_label];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
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

- (UIImage *)createShareImage:(NSString *)str name:(UIImage *)image

{
    
    CGSize size=CGSizeMake(image.size.width, image.size.height);//画布大小
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    [image drawAtPoint:CGPointMake(0, 0)];
    
    //获得一个位图图形上下文
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextDrawPath(context, kCGPathStroke);
    
    NSLog(@"frame == %@",NSStringFromCGRect(self.label.frame));
    
    CGFloat x = (self.label.frame.origin.x - self.firstImg.frame.origin.x)/self.firstImg.frame.size.width;
    
    CGFloat y = (self.label.frame.origin.y - self.firstImg.frame.origin.y)/self.firstImg.frame.size.height;
    
    [str drawAtPoint:CGPointMake(x * image.size.width, y * image.size.height) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"ArialMT" size:40],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //返回绘制的新图形
    
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

- (IBAction)composeLabelAndImg:(UIPanGestureRecognizer *)sender {
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
