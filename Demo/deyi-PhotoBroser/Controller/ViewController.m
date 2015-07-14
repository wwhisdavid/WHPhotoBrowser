//
//  ViewController.m
//  deyi-PhotoBroser
//
//  Created by deyi on 15/7/11.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "ViewController.h"
#import "WHPhotoGroup.h"
#import "WHPhotoItem.h"

@interface ViewController()

@property (nonatomic, strong) NSArray *srcStringArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"图片浏览器";
    _srcStringArray = @[@"http://h.hiphotos.baidu.com/image/w%3D2048/sign=bf43f947be315c6043956cefb989ca13/c83d70cf3bc79f3da761b162b8a1cd11738b29db.jpg",
                        @"http://a.hiphotos.baidu.com/image/w%3D2048/sign=f998dc535e6034a829e2bf81ff2b4854/71cf3bc79f3df8dcb1bddac3cf11728b461028db.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                        @"http://ww1.sinaimg.cn/thumbnail/9be2329dgw1etlyb1yu49j20c82p6qc1.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/67307b53jw1epqq3bmwr6j20c80axmy5.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/904c2a35jw1emu3ec7kf8j20c10epjsn.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/98719e4agw1e5j49zmf21j20c80c8mxi.jpg",


                        
                        ];
    
    WHPhotoGroup *photoGroup = [[WHPhotoGroup alloc] init];
    
    NSMutableArray *temp = [NSMutableArray array];
    [_srcStringArray enumerateObjectsUsingBlock:^(NSString *src, NSUInteger idx, BOOL *stop) {
        WHPhotoItem *item = [[WHPhotoItem alloc] init];
        item.thumbnail_pic = src;
        [temp addObject:item];
    }];
    
    photoGroup.photoItemArray = [temp copy];
    [self.view addSubview:photoGroup];
    //    NSLayoutConstraint *constran = [NSLayoutConstraint constraintWithItem:photoGroup attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:150];
    //    [self.view addConstraint:constran];
    
    
}

- (void)viewDidLayoutSubviews
{

}

@end
