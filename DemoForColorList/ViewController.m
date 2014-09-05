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
@property (weak, nonatomic) IBOutlet UIScrollView *pV_scroll;

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
    self.automaticallyAdjustsScrollViewInsets = NO;
    V_color_list *v = [V_color_list view];
    [self.pV_scroll addSubview:v];
    self.pV_scroll.contentSize = v.frame.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
