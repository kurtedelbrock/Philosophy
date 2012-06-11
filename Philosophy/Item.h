//
//  Item.h
//  Philosophy
//
//  Created by Jenny Zhang on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "PLDateParser.h"

@interface Item : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * filteredTimestamp;
@property (nonatomic, retain) NSDate * reminder;
@property (nonatomic, retain) NSString * itemDescription;

- (NSString *)printDescription;

@end
