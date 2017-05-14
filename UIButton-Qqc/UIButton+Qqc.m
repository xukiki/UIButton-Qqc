//
//  UIButton+Qqc.m
//  QqcFramework
//
//  Created by mahailin on 15/8/21.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "UIButton+Qqc.h"
#import <objc/runtime.h>

static char actionBlockKey;

@implementation UIButton (Qqc)

/**
 *  绑定UIButton的点击事件，使用时为了防止循环引用必须弱化拥有UIButton的对象
 *
 *  @param controlEvent 点击事件
 *  @param actionBlock  事件处理block
 */
- (void)handleControlEvent:(UIControlEvents)controlEvent withActionBlock:(ActionBlock)actionBlock
{
    objc_setAssociatedObject(self, &actionBlockKey, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:controlEvent];
}

/**
 *  点击方法回调
 *
 *  @param sender UIButton实例
 */
- (void)callActionBlock:(id)sender
{
    ActionBlock actionBlock = (ActionBlock)objc_getAssociatedObject(self, &actionBlockKey);
    
    if (actionBlock)
    {
        actionBlock(self);
    }
}

/**
 *  标题放在左边，图片放在右边
 */
- (void)leftTitleRightImage
{
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.imageView.image.size.width, 0, self.imageView.image.size.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, self.titleLabel.bounds.size.width, 0, -self.titleLabel.bounds.size.width)];
}

/**
 *  图片放在上面，标题放在下面并且居中
 */
- (void)upImageDownTitleAndAlignCenter
{
    [self setTitleEdgeInsets:UIEdgeInsetsMake(self.imageView.bounds.size.height/2, -self.imageView.image.size.width/2, -self.imageView.bounds.size.height/2, self.imageView.image.size.width/2)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(-self.titleLabel.bounds.size.height/2, self.titleLabel.bounds.size.width/2, self.titleLabel.bounds.size.height/2, -self.titleLabel.bounds.size.width/2)];
}

/**
 *  标题放在上面，图片放在下面并且居中
 */
- (void)upTitleDownImageAndAlignCenter
{
    [self setTitleEdgeInsets:UIEdgeInsetsMake(-self.imageView.bounds.size.height/2, -self.imageView.image.size.width/2, self.imageView.bounds.size.height/2, self.imageView.image.size.width/2)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(self.titleLabel.bounds.size.height/2, self.titleLabel.bounds.size.width/2, -self.titleLabel.bounds.size.height/2, -self.titleLabel.bounds.size.width/2)];
}

@end
