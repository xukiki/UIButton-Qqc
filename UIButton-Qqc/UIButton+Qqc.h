//
//  UIButton+Qqc.h
//  QqcFramework
//
//  Created by mahailin on 15/8/21.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(UIButton *button);

/**
 *  UIButton类别
 */
@interface UIButton (Qqc)

/**
 *  绑定UIButton的点击事件，使用时为了防止循环引用必须弱化拥有UIButton的对象
 *
 *  @param controlEvent 点击事件
 *  @param actionBlock  事件处理block
 */
- (void)handleControlEvent:(UIControlEvents)controlEvent withActionBlock:(ActionBlock)actionBlock;


/**
 *  标题放在左边，图片放在右边
 */
- (void)leftTitleRightImage;

/**
 *  图片放在上面，标题放在下面并且居中
 */
- (void)upImageDownTitleAndAlignCenter;

/**
 *  标题放在上面，图片放在下面并且居中
 */
- (void)upTitleDownImageAndAlignCenter;

@end
