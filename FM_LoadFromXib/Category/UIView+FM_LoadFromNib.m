//
//  UIView+LoadFromNib.m
//  TestDemo
//
//  Created by 周发明 on 17/7/21.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import "UIView+FM_LoadFromNib.h"
#import <objc/runtime.h>

@implementation UIView (FM_LoadFromNib)

+ (instancetype)fm_viewFromXib{
    UIView *view = nil;
    NSArray *views = nil;
    views = [self fm_loadFromNib];
    if (views == nil) {
        return [[self alloc] init];
    }
    view = views.lastObject;
    if (view == nil) {
        return [[self alloc] init];
    }
    object_setClass(view, self);
    return view;
}

+ (NSArray *)fm_loadFromNib{
    if ([self fm_loadNibFromName:NSStringFromClass(self)]) {
        return [self fm_loadNibFromName:NSStringFromClass(self)];
    } else {
        NSArray *arrM = nil;
        NSString *name = NSStringFromClass([super class]);
        while (![name isEqualToString:NSStringFromClass([UIResponder class])]) {
            name = [self fm_xibFileName];
            if ([self fm_loadNibFromName:name]) {
                arrM = [self fm_loadNibFromName:name];
                break;
            } else {
                Class superClass = NSClassFromString(name);
                superClass = class_getSuperclass(superClass);
                name = NSStringFromClass(superClass);
            }
        }
        return arrM;
    }
}

+ (NSArray *)fm_loadNibFromName:(NSString *)name{
    if ([self fm_isExsitNibWithName:name]) {
        return [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
    }
    return nil;
}

+ (BOOL)fm_isExsitNibWithName:(NSString *)name{
    return [[NSBundle mainBundle] pathForResource:name ofType:@"nib"] != nil;
}

+ (NSString *)fm_xibFileName{
    return NSStringFromClass(self);
}

@end
