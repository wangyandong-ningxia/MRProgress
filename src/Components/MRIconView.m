//
//  MRIconView.m
//  MRProgress
//
//  Created by Marius Rackwitz on 22.10.13.
//  Copyright (c) 2013 Marius Rackwitz. All rights reserved.
//

#import "MRIconView.h"
#import <QuartzCore/QuartzCore.h>


@implementation MRIconView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (UIBezierPath *)path {
    return nil;
}

+ (Class)layerClass {
    return CAShapeLayer.class;
}

- (CAShapeLayer *)shapeLayer {
    return (CAShapeLayer *)self.layer;
}

- (void)commonInit {
    self.layer.borderWidth = 1.0f;
    self.shapeLayer.lineWidth = 1.0f;
    self.shapeLayer.fillColor = UIColor.clearColor.CGColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.shapeLayer.path = self.path.CGPath;
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    UIColor *const tintColor = self.tintColor;
    self.layer.borderColor = tintColor.CGColor;
    self.shapeLayer.strokeColor = tintColor.CGColor;
}

- (void)setFrame:(CGRect)frame {
    super.frame = frame;
    self.layer.cornerRadius = frame.size.width / 2.0f;
}

@end


@implementation MRCheckmarkIconView

- (UIBezierPath *)path {
    UIBezierPath *path = [UIBezierPath new];
    
    CGRect bounds = self.bounds;
    [path moveToPoint:CGPointMake(bounds.size.width * 0.2f, bounds.size.height * 0.55f)];
    [path addLineToPoint:CGPointMake(bounds.size.width * 0.325f, bounds.size.height * 0.7f)];
    [path addLineToPoint:CGPointMake(bounds.size.width * 0.75f, bounds.size.height * 0.3f)];
    
    return path;
}

@end


@implementation MRCrossIconView

- (UIBezierPath *)path {
    UIBezierPath *path = [UIBezierPath new];
    
    const double relativePadding = 0.25;
    CGSize size = self.bounds.size;
    double min = relativePadding;
    double max = 1 - relativePadding;
    [path moveToPoint:CGPointMake(size.width * min, size.height * min)];
    [path addLineToPoint:CGPointMake(size.width * max, size.height * max)];
    [path moveToPoint:CGPointMake(size.width * min, size.height * max)];
    [path addLineToPoint:CGPointMake(size.width * max, size.height * min)];
    
    return path;
}

@end


@implementation MRExclamationMarkIconView

- (UIBezierPath *) path
{
    UIBezierPath *path = [UIBezierPath new];
    
    const double relativePadding = 0.2;
    CGSize size = self.bounds.size;
    double min = relativePadding;
    double max = 1 - relativePadding;
    [path moveToPoint:CGPointMake(size.width / 2, size.height * min)];
    [path addLineToPoint:CGPointMake(size.width / 2, size.height * max - 10)];
    
//    UIBezierPath *dotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(size.width / 2 - 0.5, size.height * max - 0.5, 1, 1)];
//    [dotPath fill];
//    [path appendPath:dotPath];
    
    [path moveToPoint:CGPointMake(size.width / 2 - 0.5, size.height * max - 0.5)];
    [path addLineToPoint:CGPointMake(size.width / 2 - 0.5, size.height * max + 1.5)];
    [path moveToPoint:CGPointMake(size.width / 2 + 0.5, size.height * max - 0.5)];
    [path addLineToPoint:CGPointMake(size.width / 2 + 0.5, size.height * max + 1.5)];
    
    return path;
}

@end