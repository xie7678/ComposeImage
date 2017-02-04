//
//  UIImage+Composition.h
//  ComposeImage
//
//  Created by Sam on 17/2/4.
//  Copyright © 2017年 Sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Composition)

/**
 为图片添加标签
 */
- (UIImage *) compositionWithLabel: (UILabel *) label
                   labelOfImgWithX: (CGFloat) X
                   labelOfImgWithY: (CGFloat) Y
                     fontWithColor: (UIColor *) color;

/**
 两张图片合成
 */
- (UIImage *)addImage:(UIImageView *)image1
              toImage:(UIImageView *)image2;

@end
