//
//  PLDateParser.m
//  Philosophy
//
//  Created by Jenny Zhang on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PLDateParser.h"

@implementation PLDateParser

#pragma mark - Singleton Method Calls

+ (id)sharedParser
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    return _sharedObject;
}

- (NSString *) parseDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    return [dateFormatter stringFromDate:date];
}

@end
