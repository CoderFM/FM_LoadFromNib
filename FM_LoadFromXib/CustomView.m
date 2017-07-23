//
//  CustomView.m
//  TestDemo
//
//  Created by 周发明 on 17/7/21.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation CustomView

- (void)reloadText{
    self.label.text = NSStringFromClass([self class]);
}

@end
