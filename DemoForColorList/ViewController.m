//
//  ViewController.m
//  DemoForColorList
//
//  Created by darklinden on 14-9-5.
//  Copyright (c) 2014年 darklinden. All rights reserved.
//

#import "ViewController.h"
#import "V_color_list.h"

@interface ViewController ()

@property (strong, nonatomic) UIPanGestureRecognizer *pan;
@property (strong, nonatomic) UIPinchGestureRecognizer *pinch;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAct:)];
    _pan.minimumNumberOfTouches = 1;
    _pan.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:_pan];
    
    _pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAct:)];
    [self.view addGestureRecognizer:_pinch];
}

- (void)panAct:(id)sender
{
    UIPanGestureRecognizer *regnizer = (UIPanGestureRecognizer *)sender;
    CGPoint move = [regnizer translationInView:self.view.window];
    V_color_list *pV_color_list = (V_color_list*)self.view;
    NSTimeInterval duration = pV_color_list.duration;
    duration += move.y / 100;
    
    if (duration > 1.f) {
        duration = 1.f;
    }
    
    if (duration < 0.01f) {
        duration = 0.01f;
    }
    
    pV_color_list.duration = duration;
    
    [regnizer setTranslation:CGPointZero inView:self.view.window];
    [pV_color_list setNeedsDisplay];
}

- (void)pinchAct:(id)sender
{
    UIPinchGestureRecognizer *regnizer = (UIPinchGestureRecognizer *)sender;
    CGFloat scale = regnizer.scale;
    V_color_list *pV_color_list = (V_color_list*)self.view;
    NSInteger pix = pV_color_list.pixelsize;
    
    if (scale > 1) {
        pix++;
    }
    else {
        pix--;
    }
    
    if (pix <= 0) {
        pix = 1;
    }
    
    pV_color_list.pixelsize = pix;
    
    [pV_color_list setNeedsDisplay];
}

- (IBAction)switchValueChanged:(id)sender
{
    V_color_list *pV_color_list = (V_color_list*)self.view;
    pV_color_list.runAnimation = ![(UISegmentedControl *)sender selectedSegmentIndex];
}

@end
