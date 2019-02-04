//
//  DrawingCanvasView.h
//  DrawRight
//
//  Created by Jun Oh on 2019-02-01.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface DrawingCanvasView : UIView

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;

- (UIImage *)drawings;

@end

NS_ASSUME_NONNULL_END
