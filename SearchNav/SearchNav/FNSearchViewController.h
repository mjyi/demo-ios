//
//  FNSearchViewController.h
//  SearchNav
//
//  Created by mervin on 2019/3/19.
//  Copyright © 2019 mervin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FNSearchViewDelegate <NSObject>

- (void)onSearchCancelClick;

@end


@interface FNSearchViewController : UIViewController

@property(nonatomic, weak) id<FNSearchViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
