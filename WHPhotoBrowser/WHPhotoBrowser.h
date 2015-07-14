//
//  WHPhotoBrowser.h
//  deyi-PhotoBroser
//
//  Created by deyi on 15/7/11.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WHPhotoBrowser, SDButton;


@protocol WHPhotoBrowserDelegate <NSObject>

@required

- (UIImage *)photoBrowser:(WHPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index;

@optional

- (NSURL *)photoBrowser:(WHPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index;

@end


@interface WHPhotoBrowser : UIView <UIScrollViewDelegate>



@property (nonatomic, weak) UIView *sourceImagesContainerView;
@property (nonatomic, assign) NSInteger currentImageIndex;
@property (nonatomic, assign) NSInteger imageCount;

@property (nonatomic, weak) id<WHPhotoBrowserDelegate> delegate;

- (void)show;

@end
