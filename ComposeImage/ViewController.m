//
//  ViewController.m
//  ComposeImage
//
//  Created by Sam on 17/2/3.
//  Copyright © 2017年 Sam. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)compose:(UIButton *)sender {
    
//    [self.composedImg setImage:[self getImage:_backImage.frame]];
////    [self getImage:_backImage.frame];
////    [self screenView:self.backImage];
//    self.composedImg.frame = CGRectMake(0, 100, 240, 128);
    
    self.threeImg.image = [self addImage:self.firstImg toImage:self.secImg];
}

- (IBAction)panImg:(UIPanGestureRecognizer *)sender {
    
    [sender.view.superview bringSubviewToFront:sender.view];
    CGPoint center = sender.view.center;
    CGPoint translation = [sender translationInView:self.view];
    sender.view.center = CGPointMake(center.x + translation.x, center.y + translation.y);
    [sender setTranslation:CGPointZero inView:self.view];
    
    
}

- (UIImage *)addImage:(UIImageView *)image1 toImage:(UIImageView *)image2 {
    UIGraphicsBeginImageContext(image2.frame.size);
    [image1.image drawInRect:CGRectMake(image1.frame.origin.x - image2.frame.origin.x, image1.frame.origin.y - image2.frame.origin.y, image1.frame.size.width, image1.frame.size.height)];
    [image2.image drawInRect:CGRectMake(0, 0, image2.frame.size.width, image2.frame.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}





//- (IBAction)panImage:(UIPanGestureRecognizer *)sender {
//    [sender.view.superview bringSubviewToFront:sender.view];
//    CGPoint center = sender.view.center;
//    CGPoint translation = [sender translationInView:self.view];
//    sender.view.center = CGPointMake(center.x + translation.x, center.y + translation.y);
//    [sender setTranslation:CGPointZero inView:self.view];
//
//}

//- (UIImage*)screenView:(UIView *)view{
//    
//    CGRect rect = view.frame;
//    UIGraphicsBeginImageContext(rect.size);
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
////    CGContextSaveGState(context)
////    UIRectClip(_backImage.frame);
//    [view.layer renderInContext:context];
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return img;
//}
//
//- (UIImage *) getImage: (CGRect) frame {
//    
//    UIGraphicsBeginImageContext(frame.size);
////    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, 1.5);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(context);
//    UIRectClip(frame);
//    [self.view.layer renderInContext:context];
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return img;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
