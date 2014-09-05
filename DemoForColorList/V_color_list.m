//
//  V_color_list.m
//  DemoForColorList
//
//  Created by darklinden on 14-9-5.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "V_color_list.h"

#define PixelCount  255
#define NumCount    (255 * 2 * 2 * 2)

@implementation V_color_list

+ (id)view
{
    V_color_list *obj = [[V_color_list alloc] init];
    obj.frame = CGRectMake(0, 0, 320, NumCount);
    return obj;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef contxt = UIGraphicsGetCurrentContext();
    
    CGFloat top = 0;
    
    for (CGFloat f = 0; f < 2048; f++) {
        
        NSInteger index = arc4random() % 2048;
        
        UIColor *rgb = [self colorWithValue:f];
        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
        
        top += 1;
    }
}

//- (void)drawRect:(CGRect)rect
//{
//    // Drawing code
//    CGContextRef contxt = UIGraphicsGetCurrentContext();
//    
//    CGFloat r, g, b;
//    CGFloat top = 0;
//    
//    //000
//    for (CGFloat f = 0; f <= 255; f++) {
//        
//        r = f;
//        g = f;
//        b = f;
//        
//        UIColor *rgb = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
//        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
//        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
//        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
//        
//        top += 1;
//    }
//    
//    //001
//    for (CGFloat f = 0; f <= 255; f++) {
//        
//        r = f;
//        g = f;
//        b = 255 - f;
//        
//        UIColor *rgb = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
//        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
//        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
//        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
//        
//        top += 1;
//    }
//    
//    //010
//    for (CGFloat f = 0; f <= 255; f++) {
//        
//        r = f;
//        g = 255 - f;
//        b = f;
//        
//        UIColor *rgb = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
//        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
//        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
//        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
//        
//        top += 1;
//    }
//    
//    //011
//    for (CGFloat f = 0; f <= 255; f++) {
//        
//        r = f;
//        g = 255 - f;
//        b = 255 - f;
//        
//        UIColor *rgb = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
//        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
//        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
//        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
//        
//        top += 1;
//    }
//    
//    //100
//    for (CGFloat f = 0; f <= 255; f++) {
//        
//        r = 255 - f;
//        g = f;
//        b = f;
//        
//        UIColor *rgb = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
//        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
//        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
//        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
//        
//        top += 1;
//    }
//    
//    //101
//    for (CGFloat f = 0; f <= 255; f++) {
//        
//        r = 255 - f;
//        g = f;
//        b = 255 - f;
//        
//        UIColor *rgb = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
//        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
//        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
//        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
//        
//        top += 1;
//    }
//    
//    //110
//    for (CGFloat f = 0; f <= 255; f++) {
//        
//        r = 255 - f;
//        g = 255 - f;
//        b = f;
//        
//        UIColor *rgb = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
//        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
//        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
//        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
//        
//        top += 1;
//    }
//    
//    //111
//    for (CGFloat f = 0; f <= 255; f++) {
//        
//        r = 255 - f;
//        g = 255 - f;
//        b = 255 - f;
//        
//        UIColor *rgb = [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f];
//        CGContextSetStrokeColorWithColor(contxt, rgb.CGColor);
//        CGContextSetFillColorWithColor(contxt, rgb.CGColor);
//        CGContextFillRect(contxt, CGRectMake(0, top, 320, 1));
//        
//        top += 1;
//    }
//}

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
