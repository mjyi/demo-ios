//
//  FNSearchBar.m
//  SearchNav
//
//  Created by mervin on 2019/3/18.
//  Copyright © 2019 mervin. All rights reserved.
//

#import "FNSearchBar.h"

@implementation FNSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    self.placeholder = @"Search";
//    self.backgroundImage =
//    self.backgroundColor =
    
    for (UIView *view in [[[self subviews] objectAtIndex:0] subviews]) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *field = (UITextField *)view;
//            field.layer.borderColor =
            field.layer.borderWidth = 0.5f;
            field.layer.cornerRadius = 5.f;
            break;
        }
    }
    return self;
}
@end
