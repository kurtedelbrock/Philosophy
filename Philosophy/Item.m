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
@dynamic reminder;
@dynamic itemDescription;
@synthesize filteredTimestamp;


- (NSString *)filteredTimestamp
{
    return [[PLDateParser sharedParser] readableDateString:self.timeStamp];
}

- (void)setFilteredTimestamp
{
    
}

- (NSString *)printDescription
{
    if ([self.itemDescription length] > 0)
        return self.itemDescription;
    else 
        return @"Enter description...";
}

@end
