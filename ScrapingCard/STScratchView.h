//
//  STScratchView.h
//  STScratchView
//
//  Created by Sebastien Thiebaud on 12/17/12.
//  Copyright (c) 2012 Sebastien Thiebaud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

///结束时调用
typedef void(^scratchBlock)(BOOL);

@interface STScratchView : UIView
{
    CGPoint previousTouchLocation;
    CGPoint currentTouchLocation;
    
    CGImageRef hideImage;
    CGImageRef scratchImage;

	CGContextRef contextMask;
    
    int touchCount;
}

@property (nonatomic, assign) float percentAccomplishment;
@property (nonatomic, assign) float sizeBrush;

@property (nonatomic, strong) UIView *hideView;

@property(nonatomic,copy)scratchBlock sBlock;

///是否允许刮刮
@property(nonatomic,assign)BOOL isAllowSt;

- (void)setHideView:(UIView *)hideView;

@end
