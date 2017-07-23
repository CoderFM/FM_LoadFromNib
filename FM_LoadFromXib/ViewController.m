//
//  ViewController.m
//  FM_LoadFromXib
//
//  Created by 周发明 on 17/7/23.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import "ViewController.h"

#import "CustomView.h"
#import "CustomSuvView.h"
#import "UIView+FM_LoadFromNib.h"
#import "CostomSubSubView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CostomSubSubView *view = [CostomSubSubView fm_viewFromXib];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];
    [view reloadText];
    [view hahaha];
    view.frame = CGRectMake(0, 0, 200, 100);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
