//
//  Item.m
//  Philosophy
//
//  Created by Jenny Zhang on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Item.h"


@implementation Item

@dynamic timeStamp;
@dynamic title;
@synthesize filteredTimestamp;

- (NSString *)filteredTimestamp
{
    if ([[PLDateParser sharedParser] isDateToday:self.timeStamp])
        return [[PLDateParser sharedParser] parseTime:self.timeStamp];
    else if ([[PLDateParser sharedParser] isDateThisWeek:self.timeStamp])
        return @"Monday";
    else
        return [[PLDateParser sharedParser] parseDate:self.timeStamp];
}

- (void)setFilteredTimestamp
{
    
}

@end
