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

- (NSString *) parseTime:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    return [dateFormatter stringFromDate:date];
}

- (NSString *) parseWeekday:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEE";
    return [dateFormatter stringFromDate:date];
}

- (BOOL) isDateToday:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit) fromDate:date];
    NSDate *otherDate = [cal dateFromComponents:components];
    
    return [today isEqualToDate:otherDate];
}

- (BOOL) isYesterday:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow: -(60.0f*60.0f*24.0f)];
    
    NSDateComponents *currentDayComponents = [cal components:NSDayCalendarUnit fromDate:yesterday];
    NSDateComponents *setDayComponents = [cal components:NSDayCalendarUnit fromDate:date];
    
    NSDate *currentDay = [cal dateFromComponents:currentDayComponents];
    NSDate *setDay = [cal dateFromComponents:setDayComponents];
    
    return [currentDay isEqualToDate:setDay];
}

- (BOOL)isTomorrow:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow: (60.0f*60.0f*24.0f)];
    
    NSDateComponents *currentDayComponents = [cal components:NSDayCalendarUnit fromDate:tomorrow];
    NSDateComponents *setDayComponents = [cal components:NSDayCalendarUnit fromDate:date];
    
    NSDate *currentDay = [cal dateFromComponents:currentDayComponents];
    NSDate *setDay = [cal dateFromComponents:setDayComponents];
    
    return [currentDay isEqualToDate:setDay];
}

- (BOOL) isDateThisWeek:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *todaysComponents =
    [cal components:NSWeekCalendarUnit fromDate:date];
    
    NSUInteger todaysWeek = [todaysComponents week];
    
    
    NSDate *anotherDate = [NSDate date];
    
    NSDateComponents *otherComponents =
    [cal components:NSWeekCalendarUnit fromDate:anotherDate];
    
    NSUInteger anotherWeek = [otherComponents week];
    
    if (todaysWeek==anotherWeek || todaysWeek+1==anotherWeek)
        return YES;
    else
        return NO;
}

- (NSString *)readableDateString:(NSDate *)date
{
    if ([[PLDateParser sharedParser] isDateToday:date])
        return @"Today";
    else if ([self isYesterday:date])
        return @"Yesterday";
    else if ([self isTomorrow:date])
        return @"Tomorrow";
    else if ([[PLDateParser sharedParser] isDateThisWeek:date])
        return [self dayOfWeek:date];
    else
        return [[PLDateParser sharedParser] parseDate:date];
}

- (NSString *)readableDateAndTimeString:(NSDate *)date
{
    return [NSString stringWithFormat:@"%@ at %@", [self readableDateString:date], @"3:45pm"];
}

-(NSString *)dayOfWeek:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    return [dateFormatter stringFromDate:date];
}

@end
