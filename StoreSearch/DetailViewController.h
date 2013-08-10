//
//  DetailViewController.h
//  StoreSearch
//
//  Created by Su Sheng Loong on 7/28/13.
//  Copyright (c) 2013 Su Sheng Loong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchResult;

typedef enum {
    DetailViewControllerAnimationTypeSlide,
    DetailViewControllerAnimationTypeFade
} DetailViewControllerAnimationType;

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>
@property (nonatomic, strong) SearchResult *searchResult;
@property (nonatomic, strong) UIPopoverController *masterPopoverController;

- (void)presentInParentViewController:(UIViewController *)parentViewController;
- (void)dismissFromParentViewControllerWithAnimationType:(DetailViewControllerAnimationType)animationType;
@end