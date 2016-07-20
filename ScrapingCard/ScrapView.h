//
//  ScrapView.h
//  ScrapingCard
//
//  Created by 刘康蕤 on 16/6/3.
//  Copyright © 2016年 刘康蕤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STScratchView.h"
@interface ScrapView : UIView

@property (nonatomic, strong)STScratchView * guaguaBackView;  ///< 刮刮乐背景
/**
 *  初始化所有试图
 */
- (void)allocAllSubView;

@end
