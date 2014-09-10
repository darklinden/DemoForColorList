//
//  V_color_list.h
//  DemoForColorList
//
//  Created by darklinden on 14-9-5.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface V_color_list : UIView
@property (nonatomic, assign) BOOL              runAnimation;
@property (nonatomic, assign) NSInteger         pixelsize;
@property (nonatomic, assign) NSTimeInterval    duration;

+ (id)view;

@end
