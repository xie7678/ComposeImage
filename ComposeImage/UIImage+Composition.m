//
//  UIImage+Composition.m
//  ComposeImage
//
//  Created by Sam on 17/2/4.
//  Copyright © 2017年 Sam. All rights reserved.
//

#import "UIImage+Composition.h"

@implementation UIImage (Composition)

- (UIImage *) compositionWithLabel: (UILabel *) label
                   labelOfImgWithX: (CGFloat) X
                   labelOfImgWithY: (CGFloat) Y
                     fontWithColor: (UIColor *) color{
    
    NSString *str = label.text;
    UIGraphicsBeginImageContext(self.size);//定义合成图片大小
    [self drawAtPoint:CGPointMake(0, 0)];
    //获得一个位图图形上下文
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextDrawPath(context, kCGPathStroke);
    
    [str drawAtPoint:CGPointMake(X * self.size.width, Y * self.size.height) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"ArialMT" size:40],NSForegroundColorAttributeName:color}];
    
    //返回绘制的新图形
    
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)addImage:(UIImageView *)image1 toImage:(UIImageView *)image2 {
    UIGraphicsBeginImageContext(image2.frame.size);
    [image1.image drawInRect:CGRectMake(image1.frame.origin.x - image2.frame.origin.x, image1.frame.origin.y - image2.frame.origin.y, image1.frame.size.width, image1.frame.size.height)];
    [image2.image drawInRect:CGRectMake(0, 0, image2.frame.size.width, image2.frame.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

@end
