//
//  ViewController.m
//  Font
//
//  Created by XianMingYou on 15/4/8.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "ViewController.h"
#import "FontInfomation.h"
#import "FontCell.h"
#import "FontTitleHeaderView.h"
#import "FontModel.h"

#define FONT_CELL  @"FontCell"
#define FONT_TITLE @"FontTitleHeaderView"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *fontsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 初始化数据源
    NSArray *titlesArray = [NSArray arrayWithArray:[FontInfomation fontTitles]];
    NSDictionary *fontLists   = [NSDictionary dictionaryWithDictionary:[FontInfomation systomFontNameList]];
    
    self.fontsArray = [NSMutableArray array];
    for (int i = 0; i < titlesArray.count; i++) {
        
        FontModel *model = [FontModel new];
        model.m_sectionName = titlesArray[i];
        model.m_cellArray = fontLists[model.m_sectionName];
        if (i == 0) {
            
            model.m_isExpanded = YES;
            
        } else {
            
            model.m_isExpanded = NO;
        }
        
        [_fontsArray addObject:model];
    }
    
    // 加载tableView
    [self.view addSubview:self.tableView];
}


- (UIView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                      style:UITableViewStylePlain];
        _tableView.delegate       = self;
        _tableView.dataSource     = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[FontCell class] forCellReuseIdentifier:FONT_CELL];
        [_tableView registerClass:[FontTitleHeaderView class] forHeaderFooterViewReuseIdentifier:FONT_TITLE];
    }
    
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    FontModel *model = _fontsArray[section];
    
    if (model.m_isExpanded) {
        
        return model.m_cellArray.count;
    } else {
        return 0;
    }
    
    return model.m_cellArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _fontsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FontCell *cell = [tableView dequeueReusableCellWithIdentifier:FONT_CELL];
    
    FontModel *model = _fontsArray[indexPath.section];
    [cell accessData:model.m_cellArray[indexPath.row]];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    FontTitleHeaderView *titleView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:FONT_TITLE];
    
    titleView.section  = section;
    FontModel *model = _fontsArray[section];
    
    __block FontTitleHeaderView *weakHeaderView = titleView;
    
    titleView.headerBlock = ^(NSInteger headerSection){
        
        FontModel *headerModel = _fontsArray[headerSection];
    
        if (headerModel.m_isExpanded) {
            
            headerModel.m_isExpanded = NO;
            [weakHeaderView normalStateAnimated:YES];
            
            NSMutableArray *indexPathArray = [NSMutableArray array];
            for (int i = 0; i < headerModel.m_cellArray.count; i++) {
                
                [indexPathArray addObject:[NSIndexPath indexPathForItem:i inSection:headerSection]];
            }
            [_tableView deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
            
        } else {
            
            headerModel.m_isExpanded = YES;
            [weakHeaderView extendStateAnimated:YES];
            
            NSMutableArray *indexPathArray = [NSMutableArray array];
            for (int i = 0; i < headerModel.m_cellArray.count; i++) {
                
                [indexPathArray addObject:[NSIndexPath indexPathForItem:i inSection:headerSection]];
            }
            [_tableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
        }
    };
    
    [titleView accessData:model];
    
    if (model.m_isExpanded) {
        
        [titleView extendStateAnimated:NO];
        
    } else {
        
        [titleView normalStateAnimated:NO];
    }
    
    return titleView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}


@end
