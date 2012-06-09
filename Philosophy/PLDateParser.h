//
//  PLDateParser.h
//  Philosophy
//
//  Created by Jenny Zhang on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLDateParser : NSObject

+ (id)sharedParser;
- (NSString *) parseDate:(NSDate *)date;
- (BOOL) isDateToday:(NSDate *)date;
- (NSString *) parseTime:(NSDate *)date;

@end
