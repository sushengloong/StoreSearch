//
//  DetailViewController.h
//  StoreSearch
//
//  Created by Su Sheng Loong on 7/28/13.
//  Copyright (c) 2013 Su Sheng Loong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchResult;

@interface DetailViewController : UIViewController
@property (nonatomic, strong) SearchResult *searchResult;
@end
