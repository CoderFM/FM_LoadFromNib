//
//  UIView+LoadFromNib.h
//  TestDemo
//
//  Created by 周发明 on 17/7/21.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FM_LoadFromNib)

+ (instancetype)fm_viewFromXib;

+ (NSString *)fm_xibFileName;

@end
