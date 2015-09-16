//
//  FontTitleHeaderView.m
//  Font
//
//  Created by XianMingYou on 15/4/8.
//  Copyright (c) 2015年 XianMingYou. All rights reserved.
//

#import "FontTitleHeaderView.h"
#import "FontModel.h"

#define Width  [UIScreen mainScreen].bounds.size.width

@interface FontTitleHeaderView ()

@property (nonatomic, strong) UILabel           *m_nomalTitleLabel;
@property (nonatomic, strong) UILabel           *m_highlightLabel;
@property (nonatomic, strong) UIImageView       *arrowImageView;
@property (nonatomic)         CGAffineTransform m_defaultTransform;

@end

@implementation FontTitleHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.m_nomalTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(7.f, 5, Width-7-40, 30)];
        _m_nomalTitleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Medium" size:12];
        self.m_nomalTitleLabel.textColor = [UIColor colorWithRed:0.133 green:0.620 blue:0.796 alpha:1];
        [self addSubview:self.m_nomalTitleLabel];
        
        self.m_highlightLabel = [[UILabel alloc]initWithFrame:_m_nomalTitleLabel.frame];
        _m_highlightLabel.font      = _m_nomalTitleLabel.font;
        _m_highlightLabel.textColor = [UIColor redColor];
        [self addSubview:_m_highlightLabel];
        
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
        _m_nomalTitleLabel.text = model.m_sectionName;
        _m_highlightLabel.text  = model.m_sectionName;
    }
}

- (void)normalStateAnimated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            _arrowImageView.transform = _m_defaultTransform;
            _m_nomalTitleLabel.alpha  = 1;
            _m_nomalTitleLabel.frame  = CGRectMake(7, 5, Width-7-40, 30);
            _m_highlightLabel.alpha   = 0;
            _m_highlightLabel.frame   = CGRectMake(7, 5, Width-7-40, 30);
            
        } completion:^(BOOL finished) {
            
        }];
        
    } else {
        
        _arrowImageView.transform = _m_defaultTransform;
        _m_nomalTitleLabel.alpha  = 1;
        _m_nomalTitleLabel.frame  = CGRectMake(7, 5, Width-7-40, 30);
        _m_highlightLabel.alpha   = 0;
        _m_highlightLabel.frame   = CGRectMake(7, 5, Width-7-40, 30);
    }
}

- (void)extendStateAnimated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            _arrowImageView.transform = CGAffineTransformRotate(_m_defaultTransform, M_PI_2);
            _m_nomalTitleLabel.alpha  = 0;
            _m_nomalTitleLabel.frame  = CGRectMake(7+10, 5, Width-7-40, 30);
            _m_highlightLabel.alpha   = 1;
            _m_highlightLabel.frame   = CGRectMake(7+10, 5, Width-7-40, 30);
            
        } completion:^(BOOL finished) {
            
        }];
        
    } else {
        
        _arrowImageView.transform = CGAffineTransformRotate(_m_defaultTransform, M_PI_2);
        _m_nomalTitleLabel.alpha  = 0;
        _m_nomalTitleLabel.frame  = CGRectMake(7+10, 5, Width-7-40, 30);
        _m_highlightLabel.alpha   = 1;
        _m_highlightLabel.frame   = CGRectMake(7+10, 5, Width-7-40, 30);
    }
}

@end
