//
//  FontTitleHeaderView.h
//  Font
//
//  Created by XianMingYou on 15/4/8.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontTitleHeaderView : UITableViewHeaderFooterView

@property (nonatomic) NSInteger section;

@property (nonatomic,copy) void (^headerBlock)(NSInteger section);

- (void)accessData:(id)data;

- (void)normalStateAnimated:(BOOL)animated;

- (void)extendStateAnimated:(BOOL)animated;

@end
