//
//  ViewController.h
//  StoreSearch
//
//  Created by Su Sheng Loong on 7/22/13.
//  Copyright (c) 2013 Su Sheng Loong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface SearchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, weak) DetailViewController *detailViewController;

@end
