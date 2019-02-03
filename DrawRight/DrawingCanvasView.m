//
//  DrawingCanvasView.m
//  DrawRight
//
//  Created by Jun Oh on 2019-02-01.
//  Copyright © 2019 Matthew Chan. All rights reserved.
//

#import "DrawingCanvasView.h"


CGPoint midPoint(CGPoint p1, CGPoint p2)
{
  return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}

@interface DrawingCanvasView ()
{
  CGPoint currentPoint;
  CGPoint previousPoint1;
  CGPoint previousPoint2;
  CGMutablePathRef path;
}

@end

@implementation DrawingCanvasView


const CGFloat kDefaultLineWidth = 10.0f;

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self configure];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self configure];
  }
  return self;
}

- (void)configure {
  // set the default values for the public properties
  self.lineWidth = kDefaultLineWidth;
  
  // set the transparent background
  self.backgroundColor = UIColor.clearColor;
  path = CGPathCreateMutable();
}


- (void)drawRect:(CGRect)rect {
  [self draw];
}

- (void)draw {
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextAddPath(context, path);
  CGContextSetLineCap(context, kCGLineCapRound);
  CGContextSetLineWidth(context, self.lineWidth);
  CGContextStrokePath(context);
}

- (UIImage *)drawings {
  UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
  
  [self draw];
  
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return image;
}

- (UIImage *)image {
  UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
  [self.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  // add the first touch
  UITouch *touch = [touches anyObject];
  previousPoint1 = [touch previousLocationInView:self];
  currentPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  // save all the touches in the path
  UITouch *touch = [touches anyObject];
  
  previousPoint2 = previousPoint1;
  previousPoint1 = [touch previousLocationInView:self];
  currentPoint = [touch locationInView:self];
  
  [self addPathPreviousPreviousPoint:previousPoint2 withPreviousPoint:previousPoint1 withCurrentPoint:currentPoint];
  
  [self setNeedsDisplay];
  
}

- (CGRect)addPathPreviousPreviousPoint:(CGPoint)p2Point withPreviousPoint:(CGPoint)p1Point withCurrentPoint:(CGPoint)cpoint {
  
  CGPoint mid1 = midPoint(p1Point, p2Point);
  CGPoint mid2 = midPoint(cpoint, p1Point);
  CGMutablePathRef subpath = CGPathCreateMutable();
  CGPathMoveToPoint(subpath, NULL, mid1.x, mid1.y);
  CGPathAddQuadCurveToPoint(subpath, NULL, p1Point.x, p1Point.y, mid2.x, mid2.y);
  CGRect bounds = CGPathGetBoundingBox(subpath);
  
  CGPathAddPath(path, NULL, subpath);
  CGPathRelease(subpath);
  
  return bounds;
}

- (void)dealloc {
  CGPathRelease(path);
}

@end
