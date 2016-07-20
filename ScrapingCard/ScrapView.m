//
//  ScrapView.m
//  ScrapingCard
//
//  Created by 刘康蕤 on 16/6/3.
//  Copyright © 2016年 刘康蕤. All rights reserved.
//

#import "ScrapView.h"

#define SWIDTH self.frame.size.width
#define SHEIGHT self.frame.size.height
//主题颜色
#define kMAINCOLOR [UIColor colorWithRed:1.000 green:0.314 blue:0.004 alpha:1.000]

@interface ScrapView()

@property (nonatomic, strong)UIView *mainView;  ///< 被刮得view



@property (nonatomic, weak)UIImageView * imageView;

@property (nonatomic, strong)UILabel * prizeLab;  ///< 奖品lab

@end

@implementation ScrapView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.prizeLab];
        [self addSubview:self.guaguaBackView];
    }
    return self;
}

#pragma mark  ****  getter  ****
- (STScratchView *)guaguaBackView {
    if (_guaguaBackView == nil) {
        _guaguaBackView = [[STScratchView alloc] initWithFrame:CGRectMake(10, 10, SWIDTH - 20, SHEIGHT - 20)];
        [_guaguaBackView setContentMode:UIViewContentModeScaleAspectFit];
        _guaguaBackView.backgroundColor = [UIColor clearColor];
        [_guaguaBackView setSizeBrush:40.0];
        
        if (!_mainView) {
            [_guaguaBackView setHideView:self.mainView];
        }else {
            [_guaguaBackView setHideView:_mainView];
        }
        
        
//        __weak typeof(self) weakSelf = self;
        
        __weak ScrapView * scrView = self;
        _guaguaBackView.sBlock = ^(BOOL abool) {
            NSLog(@"结束");
            [scrView scrapFinishedAction];
        };
    }
    return _guaguaBackView;
}

- (UIView *)mainView {
    if (_mainView == nil) {
        _mainView = [[UIView alloc] initWithFrame:self.guaguaBackView.bounds];
        _mainView.backgroundColor = [UIColor clearColor];
        
        UIImageView * imageV = [[UIImageView alloc] initWithFrame:self.guaguaBackView.bounds];
        imageV.backgroundColor = kMAINCOLOR;
        imageV.alpha = 1.0;
        imageV.image = [UIImage imageNamed:@"game_guaguale"];
        [_mainView addSubview:imageV];
        _imageView = imageV;

    }
    return _mainView;
}


- (UILabel *)prizeLab {
    if (_prizeLab == nil) {
        _prizeLab = [[UILabel alloc] initWithFrame:self.guaguaBackView.bounds];
        _prizeLab.text = @"你中奖啦！";
        _prizeLab.textAlignment = NSTextAlignmentCenter;
        _prizeLab.font = [UIFont systemFontOfSize:20];
        _prizeLab.textColor = [UIColor redColor];
    }
    return _prizeLab;
}


- (void)scrapFinishedAction {
    [UIView animateWithDuration:0.6 animations:^{
        _guaguaBackView.alpha = 0.0;
    } completion:^(BOOL finished) {
        _guaguaBackView.hidden = YES;
    }];
}

// 初始化所有view
- (void)allocAllSubView {

    [_guaguaBackView removeFromSuperview];

    _guaguaBackView = nil;
    [self addSubview:self.guaguaBackView];
}

@end
