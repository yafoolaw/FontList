//
//  FontTitleHeaderView.m
//  Font
//
//  Created by XianMingYou on 15/4/8.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "FontTitleHeaderView.h"
#import "FontModel.h"

@interface FontTitleHeaderView ()

@property (nonatomic, strong) UILabel           *titleLabel;
@property (nonatomic, strong) UIImageView       *arrowImageView;
@property (nonatomic)         CGAffineTransform m_defaultTransform;

@end

@implementation FontTitleHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.titleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(7.f, 5, [UIScreen mainScreen].bounds.size.width-7-40, 30)];
        self.titleLabel.font      = [UIFont systemFontOfSize:12.f];
        self.titleLabel.textColor = [UIColor colorWithRed:0.133 green:0.620 blue:0.796 alpha:1];
        [self addSubview:self.titleLabel];
        
        self.arrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 40,  15, 10, 10)];
        self.arrowImageView.image = [UIImage imageNamed:@"arrow"];
        [self addSubview:self.arrowImageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
        
        self.m_defaultTransform = _arrowImageView.transform;
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 39.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
        lineView.backgroundColor = [UIColor yellowColor];
        [self addSubview:lineView];
        
        self.contentView.backgroundColor = [UIColor blackColor] ;
    }
    
    return self;
}

- (void)tapAction {
    
    self.headerBlock(_section);

}

- (void)accessData:(id)data {
    
    if ([data isKindOfClass:[FontModel class]]) {
        
        FontModel *model = (FontModel*)data;
        self.titleLabel.text = model.m_sectionName;
    }
}

- (void)normalStateAnimated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:0.5f animations:^{
            
                             _arrowImageView.transform = _m_defaultTransform;
                         }];
    } else {
        
        _arrowImageView.transform = _m_defaultTransform;
    }
}

- (void)extendStateAnimated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:0.5f animations:^{
            
                             _arrowImageView.transform = CGAffineTransformRotate(_m_defaultTransform, M_PI_2);
                         }];
    } else {
        
        _arrowImageView.transform = CGAffineTransformRotate(_m_defaultTransform, M_PI_2);
    }
}

@end
