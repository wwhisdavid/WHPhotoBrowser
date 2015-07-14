//
//  WHPhotoGroup.m
//  deyi-PhotoBroser
//
//  Created by deyi on 15/7/11.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "WHPhotoGroup.h"
#define WHPhotoGroupImageMargin 10
#import "WHPhotoGroup.h"
#import "WHPhotoItem.h"
#import "UIButton+WebCache.h"
#import "WHPhotoBrowser.h"


@interface WHPhotoGroup () <WHPhotoBrowserDelegate>

@end

@implementation WHPhotoGroup

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 清除图片缓存，便于测试
        [[SDWebImageManager sharedManager].imageCache clearDisk];
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}


- (void)setPhotoItemArray:(NSArray *)photoItemArray
{
    _photoItemArray = photoItemArray;
    [photoItemArray enumerateObjectsUsingBlock:^(WHPhotoItem *obj, NSUInteger idx, BOOL *stop) {
        UIButton *btn = [[UIButton alloc] init];
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
//        [btn sd_setImageWithURL:[NSURL URLWithString:obj.thumbnail_pic] forState:UIControlStateNormal];
        [btn sd_setImageWithURL:[NSURL URLWithString:obj.thumbnail_pic] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"dy_share_pengyouquan"]];
        
        btn.tag = idx;
        
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    long imageCount = self.photoItemArray.count;
    int perRowImageCount = ((imageCount == 4) ? 2 : 3);
    CGFloat perRowImageCountF = (CGFloat)perRowImageCount;
    int totalRowCount = ceil(imageCount / perRowImageCountF); // ((imageCount + perRowImageCount - 1) / perRowImageCount)
#warning !
    //图片宽高设置
    CGFloat w = 60;
    CGFloat h = 60;
    //
    //
    //    /*** ?! ***/
    [self.subviews enumerateObjectsUsingBlock:^(UIButton *btn, NSUInteger idx, BOOL *stop) {
        
        long rowIndex = idx / perRowImageCount;
        int columnIndex = idx % perRowImageCount;
        CGFloat x = columnIndex * (w + WHPhotoGroupImageMargin);
        CGFloat y = rowIndex * (h + WHPhotoGroupImageMargin);
        btn.frame = CGRectMake(x, y, w, h);
        //        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:btn.superview attribute:NSLayoutAttributeTop multiplier:1 constant:(rowIndex + 1) * SDPhotoGroupImageMargin + rowIndex * 80];
        //        [self addConstraint:constraint];
        //
        //        constraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:btn.superview attribute:NSLayoutAttributeLeft multiplier:1 constant:(columnIndex + 1) * SDPhotoGroupImageMargin + rowIndex * 80];
        //        [self addConstraint:constraint];
        //
        //        constraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:80];
        //        [self addConstraint:constraint];
        //        constraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:80];
        //        [self addConstraint:constraint];
    }];
#warning !
    //放置图片的view的frame
    self.frame = CGRectMake(10, 80, 280, totalRowCount * (WHPhotoGroupImageMargin + h));
    
    
}

- (void)buttonClick:(UIButton *)button
{
    WHPhotoBrowser *browser = [[WHPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = self; // 原图的父控件
    browser.imageCount = self.photoItemArray.count; // 图片总数
    browser.currentImageIndex = button.tag;
    browser.delegate = self;
    [browser show];
    
}

#pragma mark - photobrowser代理方法

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(WHPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return [self.subviews[index] currentImage];
}


// 返回高质量图片的url
- (NSURL *)photoBrowser:(WHPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSString *urlStr = [[self.photoItemArray[index] thumbnail_pic] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
    return [NSURL URLWithString:urlStr];
}

@end
