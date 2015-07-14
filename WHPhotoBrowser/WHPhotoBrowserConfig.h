//
//  WHPhotoBrowserConfig.h
//  deyi-PhotoBroser
//
//  Created by deyi on 15/7/11.
//  Copyright (c) 2015年 deyi. All rights reserved.
//


typedef enum {
    WHWaitingViewModeLoopDiagram, // 环形
    WHWaitingViewModePieDiagram // 饼型
} WHWaitingViewMode;

// 图片保存成功提示文字
#define WHPhotoBrowserSaveImageSuccessText @" ^_^ 保存成功 ";

// 图片保存失败提示文字
#define WHPhotoBrowserSaveImageFailText @" >_< 保存失败 ";

// browser背景颜色
#define WHPhotoBrowserBackgrounColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.95]

// browser中图片间的margin
#define WHPhotoBrowserImageViewMargin 10

// browser中显示图片动画时长
#define WHPhotoBrowserShowImageAnimationDuration 0.8f

// browser中显示图片动画时长
#define WHPhotoBrowserHideImageAnimationDuration 0.8f

// 图片下载进度指示进度显示样式（WHWaitingViewModeLoopDiagram 环形，WHWaitingViewModePieDiagram 饼型）
#define WHWaitingViewProgressMode WHWaitingViewModeLoopDiagram

// 图片下载进度指示器背景色
#define WHWaitingViewBackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]

// 图片下载进度指示器内部控件间的间距
#define WHWaitingViewItemMargin 10


