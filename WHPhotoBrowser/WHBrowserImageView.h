//
//  WHBrowserImageView.h
//  deyi-PhotoBroser
//
//  Created by deyi on 15/7/11.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WHWaitingView.h"

@interface WHBrowserImageView : UIImageView
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign, readonly) BOOL isScaled;
@property (nonatomic, assign) BOOL hasLoadedImage;

- (void)eliminateScale; // 清除缩放

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)doubleTapTOZommWithScale:(CGFloat)scale;

- (void)clear;
@end
