//
//  V_color_list.m
//  DemoForColorList
//
//  Created by darklinden on 14-9-5.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "V_color_list.h"

@implementation V_color_list

+ (id)view
{
    V_color_list *obj = [[V_color_list alloc] init];
    return obj;
}

- (void)drawRect:(CGRect)rect
{
    if (!_pixelsize) {
        _pixelsize = 1;
    }
    
    if (!_duration) {
        _duration = 1.f;
    }
    
    CGContextRef contxt = UIGraphicsGetCurrentContext();
    
    for (int x = 0; x <= self.frame.size.width; x+=_pixelsize) {
        for (int y = 0; y <= self.frame.size.height; y+=_pixelsize) {
            
//            NSInteger index = arc4random() % 2048;
//            UIColor *rgb = [self colorWithValue:index];

            NSInteger r = arc4random() % 256;
            NSInteger g = arc4random() % 256;
            NSInteger b = arc4random() % 256;
            UIColor *rgb = [UIColor colorWithRed:(CGFloat)r / 255.f
                                           green:(CGFloat)g / 255.f
                                            blue:(CGFloat)b / 255.f
                                           alpha:1.f];
            
            CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
            CGContextSetFillColorWithColor(contxt, rgb.CGColor);
            CGContextFillRect(contxt, CGRectMake(x, y, _pixelsize, _pixelsize));
        }
    }
    
    if (_runAnimation) {
        [self performSelector:@selector(setNeedsDisplay) withObject:nil afterDelay:_duration];
    }
}

- (void)setRunAnimation:(BOOL)runAnimation
{
    _runAnimation = runAnimation;
    if (runAnimation) {
        [self setNeedsDisplay];
    }
}

//value between 0 - 2047
- (UIColor *)colorWithValue:(NSInteger)value
{
    CGFloat f = value;
    CGFloat r, g, b; r = g = b = 0;
    
    if (f >= 0
        && f < 256) {
        r = f;
        g = f;
        b = f;
    }
    else if (f >= 256
             && f < 512) {
        f -= 256;
        r = f;
        g = f;
        b = 255.f - f;
    }
    else if (f >= 512
             && f < 768) {
        f -= 512;
        r = f;
        g = 255.f - f;
        b = f;
    }
    else if (f >= 768
             && f < 1024) {
        f -= 768;
        r = f;
        g = 255.f - f;
        b = 255.f - f;
    }
    else if (f >= 1024
             && f < 1280) {
        f -= 1024;
        r = 255.f - f;
        g = f;
        b = f;
    }
    else if (f >= 1280
             && f < 1536) {
        f -= 1280;
        r = 255.f - f;
        g = f;
        b = 255.f - f;
    }
    else if (f >= 1536
             && f < 1792) {
        f -= 1536;
        r = 255.f - f;
        g = 255.f - f;
        b = f;
    }
    else if (f >= 1792
             && f < 2048) {
        f -= 1792;
        r = 255.f - f;
        g = 255.f - f;
        b = 255.f - f;
    }
    
    return [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
}

@end
