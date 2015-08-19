//
//  FontModel.h
//  Font
//
//  Created by FrankLiu on 15/8/18.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FontModel : NSObject

@property (nonatomic,strong) NSString       *m_sectionName;
@property (nonatomic,strong) NSMutableArray *m_cellArray;
@property (nonatomic)        BOOL           m_isExpanded;

@end
