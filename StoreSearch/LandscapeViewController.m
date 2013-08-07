//
//  LandscapeViewController.m
//  StoreSearch
//
//  Created by Su Sheng Loong on 8/7/13.
//  Copyright (c) 2013 Su Sheng Loong. All rights reserved.
//

#import "LandscapeViewController.h"
#import "SearchResult.h"

@interface LandscapeViewController ()
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

- (IBAction)pageChanged:(UIPageControl *)sender;
@end

@implementation LandscapeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)tileButtons
{
    const CGFloat itemWidth = 96.0f;
    const CGFloat itemHeight = 88.0f;
    const CGFloat buttonWidth = 82.0f;
    const CGFloat buttonHeight = 82.0f;
    const CGFloat marginHorz = (itemWidth - buttonWidth)/2.0f;
    const CGFloat marginVert = (itemHeight - buttonHeight)/2.0f;
    
    int index = 0;
    int row = 0;
    int column = 0;
    
    for (SearchResult *searchResult in self.searchResults) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(column*itemWidth + marginHorz, row*itemHeight + marginVert, buttonWidth, buttonHeight);
        [button setTitle:[NSString stringWithFormat:@"%d", index] forState:UIControlStateNormal];
        [self.scrollView addSubview:button];
        
        index++;
        row++;
        if (row == 3) {
            row = 0;
            column++;
        }
    }
    
    int numPages = ceilf([self.searchResults count] / 15.0f);
    self.scrollView.contentSize = CGSizeMake(numPages*480.0f, self.scrollView.bounds.size.height);
    
    NSLog(@"Number of pages: %d", numPages);
    
    self.pageControl.numberOfPages = numPages;
    self.pageControl.currentPage = 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"LandscapeBackground"]];
    
    [self tileButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"dealloc %@", self);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)scrollViewDidScroll:(UIScrollView *)theScrollView
{
    CGFloat width = self.scrollView.bounds.size.width;
    int currentPage = (self.scrollView.contentOffset.x + width/2.0f) / width;
    self.pageControl.currentPage = currentPage;
}

- (IBAction)pageChanged:(UIPageControl *)sender
{
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.scrollView.contentOffset = CGPointMake(self.scrollView.bounds.size.width * sender.currentPage, 0);
                     }
                     completion:nil];
}

@end
