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
    return [[PLDateParser sharedParser] parseDate:self.timeStamp];
}

- (void)setFilteredTimestamp
{
    
}

@end
