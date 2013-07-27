//
//  SearchResult.m
//  StoreSearch
//
//  Created by Su Sheng Loong on 7/22/13.
//  Copyright (c) 2013 Su Sheng Loong. All rights reserved.
//

#import "SearchResult.h"

@implementation SearchResult
- (NSComparisonResult)compareName:(SearchResult *)other
{
    return [self.name localizedStandardCompare:other.name];
}
@end
