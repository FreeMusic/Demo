//
//  SXYAnimationLayer.m
//  烟花带表白动画
//
//  Created by mic on 2017/8/30.
//  Copyright © 2017年 yunfu. All rights reserved.
//

#import "SXYAnimationLayer.h"

@interface SXYAnimationLayer ()

@property (nonatomic, strong) CAShapeLayer *pathLayer;
@property (nonatomic, strong) CAShapeLayer *heartpPathLayer;
@property (nonatomic, strong) CALayer *penLayer;

@end

@implementation SXYAnimationLayer

+ (void)createAnimationLayerByString:(NSString *)string andRect:(CGRect)rect andView:(UIView *)view andFont:(UIFont *)ui_font andStrokeColor:(UIColor *)color{
    
    SXYAnimationLayer *animationLayer = [SXYAnimationLayer layer];
    animationLayer.frame = rect;
    [view.layer addSublayer:animationLayer];
    
    if (animationLayer.pathLayer != nil) {
        [animationLayer.penLayer removeFromSuperlayer];
        [animationLayer.pathLayer removeFromSuperlayer];
        [animationLayer.heartpPathLayer removeFromSuperlayer];
        
        animationLayer.pathLayer = nil;
        animationLayer.heartpPathLayer = nil;
        animationLayer.penLayer = nil;
    }
    
    CTFontRef font = CTFontCreateWithName((CFStringRef)ui_font.fontName, ui_font.pointSize, NULL);
    CGMutablePathRef letters = CGPathCreateMutable();
    
    //这里设置画线的字体和大小
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)font,kCTFontAttributeName, nil];
    NSAttributedString *attriString = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attriString);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    //for each run
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++) {
        //get font for this run
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        //for each GLYPH in run
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++) {
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform transform = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &transform, letter);
                CGPathRelease(letter);
            }
        }
    }
    
    CFRelease(line);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    
    CGPathRelease(letters);
    CFRelease(font);
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height-230);
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [color CGColor];
    pathLayer.fillColor = nil;
    pathLayer.lineWidth = 1.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    [animationLayer addSublayer:pathLayer];
    animationLayer.pathLayer = pathLayer;
    
    UIImage *penImage = [UIImage imageNamed:@"noun_project_347_2.png"];
    CALayer *penLayer = [CALayer layer];
    penLayer.contents = (id)penImage.CGImage;
    penLayer.anchorPoint = CGPointZero;
    penLayer.frame = CGRectMake(0, 0, penImage.size.width, penImage.size.height);
    [pathLayer addSublayer:penLayer];
    animationLayer.penLayer = penLayer;
    
    [animationLayer.pathLayer removeAllAnimations];
    [animationLayer.penLayer removeAllAnimations];
    
    animationLayer.penLayer.hidden = NO;
    
    CGFloat spaceWidth = 20;
    
    CGFloat radius = MIN((rect.size.width-spaceWidth*2)/4, (rect.size.height-spaceWidth*2)/4);
    
    //左侧圆心 位于左侧边距+半径宽度
    CGPoint leftCenter = CGPointMake(spaceWidth+radius, radius/2);
    //右侧圆心 位于左侧圆心的右侧 距离为两倍半径
    CGPoint rightCenter = CGPointMake(spaceWidth+radius*3, radius/2);
    
    //左侧半圆
    UIBezierPath *headrtLine = [UIBezierPath bezierPath];
    [headrtLine addArcWithCenter:leftCenter radius:radius startAngle:0 endAngle:M_PI clockwise:NO];
    //曲线连接到新的底部顶点 为了弧线效果 控制点 坐标x为总宽度减spaceWidth 刚好可以相切 平滑过渡 y可以根据需要进行调整 y越大 所画出来的线越接近内切圆弧
    [headrtLine addQuadCurveToPoint:CGPointMake(rect.size.width/2, rect.size.height-spaceWidth*6) controlPoint:CGPointMake(spaceWidth, rect.size.height*0.3)];
    
    CAShapeLayer *heartpathLayer = [CAShapeLayer layer];
    heartpathLayer.path = headrtLine.CGPath;
    heartpathLayer.strokeColor = [[UIColor redColor] CGColor];
    heartpathLayer.fillColor = nil;
    heartpathLayer.lineWidth = 1.0f;
    heartpathLayer.lineJoin = kCALineJoinRound;
    [animationLayer addSublayer:heartpathLayer];
    
    CABasicAnimation *heartPathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    heartPathAnimation.duration = 5.0;
    heartPathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    heartPathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [heartpathLayer addAnimation:heartPathAnimation forKey:@"strokeEnd"];
    
    //右侧半圆
    UIBezierPath *heartRightLine = [UIBezierPath bezierPath];
    [heartRightLine addArcWithCenter:rightCenter radius:radius startAngle:M_PI endAngle:0 clockwise:YES];
    [heartRightLine addQuadCurveToPoint:CGPointMake(rect.size.width/2, rect.size.height-spaceWidth*6) controlPoint:CGPointMake(rect.size.width-spaceWidth, rect.size.height*0.3)];
    
    CAShapeLayer *heartRightLayer = [CAShapeLayer layer];
    heartRightLayer.path = heartRightLine.CGPath;
    heartRightLayer.strokeColor = [[UIColor redColor] CGColor];
    heartRightLayer.fillColor = nil;
    heartRightLayer.lineJoin = kCALineJoinRound;
    [animationLayer addSublayer:heartRightLayer];
    
    CABasicAnimation *heartRightAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    heartRightAnimation.duration = 5.0;
    heartRightAnimation.fromValue = @(0);
    heartRightAnimation.toValue = @(1.0);
    [heartRightLayer addAnimation:heartRightAnimation forKey:@"strokeEnd"];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 5.0;
    pathAnimation.fromValue = @(0);
    pathAnimation.toValue = @(1.0);
    [animationLayer.pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    CAKeyframeAnimation *penAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    penAnimation.duration = 5.0;
    penAnimation.path = animationLayer.pathLayer.path;
    penAnimation.calculationMode = kCAAnimationPaced;
    penAnimation.delegate = animationLayer;
    [animationLayer.penLayer addAnimation:penAnimation forKey:@"position"];
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.penLayer.hidden = YES;
}

@end
