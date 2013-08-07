//
//  LandscapeViewController.h
//  StoreSearch
//
//  Created by Su Sheng Loong on 8/7/13.
//  Copyright (c) 2013 Su Sheng Loong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Search;

@interface LandscapeViewController : UIViewController <UIScrollViewDelegate>
@property (nonatomic, strong) Search *search;
@end
