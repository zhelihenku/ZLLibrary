//
//  ZLUtil.m
//  ZLLibrary
//
//  Created by PhilWang on 2019/6/21.
//  Copyright © 2019 ZHELIHENKU. All rights reserved.
//

#import "ZLUtil.h"

static NSDateFormatter *g_dayDateFormatter;

@implementation ZLUtil

#pragma mark -
#pragma mark ------------- Date --------------
+ (void)load {
	g_dayDateFormatter = [[NSDateFormatter alloc] init];
}

+ (NSString *)getNewTimestamp {
	NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[[NSDate new] timeIntervalSince1970]];
	return timestamp;
}

+ (NSString *)getTimestampFromUTC {
	NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[[NSDate new] timeIntervalSince1970]];
	return timestamp;
}

+ (NSString *)timeToText:(NSDate *)time {
	NSString *timeText = @"";
	
	NSCalendar *calender = [NSCalendar currentCalendar];
	NSDateComponents *components = [calender components:(NSCalendarUnitYear |
														 NSCalendarUnitMonth |
														 NSCalendarUnitDay |
														 NSCalendarUnitHour |
														 NSCalendarUnitMinute |
														 NSCalendarUnitSecond)
											   fromDate:time
												 toDate:[NSDate date] options:0];
	
	[g_dayDateFormatter setTimeZone:[NSTimeZone localTimeZone]];
	[g_dayDateFormatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
	if ([components year]) {
		timeText = [[g_dayDateFormatter stringFromDate:time] substringToIndex:10];
	} else if ([components month]) {
		timeText = [[g_dayDateFormatter stringFromDate:time] substringToIndex:10];
	} else if ([components day]) {
		if ([components day] > 7) {
			timeText = [[g_dayDateFormatter stringFromDate:time] substringToIndex:10];
		} else {
			timeText = [NSString stringWithFormat:@"%ld天前", (long)[components day]];
		}
	} else if ([components hour]) {
		timeText = [NSString stringWithFormat:@"%ld小时前", (long)[components hour]];
	} else if ([components minute]) {
		if ([components minute] < 0) {
			timeText = @"刚刚";
		} else {
			timeText = [NSString stringWithFormat:@"%ld分钟前", (long)[components minute]];
		}
	} else if ([components second]) {
		if ([components second] < 0) {
			timeText = @"刚刚";
		} else {
			timeText = [NSString stringWithFormat:@"%ld秒前", (long)[components second]];
		}
	} else {
		timeText = @"刚刚";
	}
	return timeText;
}

+ (NSString *)stringFromDate:(NSDate *)aDate format:(NSString *)dateFormat {
	return [self stringFromDate:aDate format:dateFormat timeZone:[NSTimeZone localTimeZone] dateLocale:[NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"]];
}

+ (NSString *)stringFromDate:(NSDate *)aDate format:(NSString *)dateFormat timeZone:(NSTimeZone *)timeZone dateLocale:(NSLocale *)locale {
	[g_dayDateFormatter setDateFormat:dateFormat];
	[g_dayDateFormatter setTimeZone:timeZone];
	[g_dayDateFormatter setLocale:locale];
	NSString *localDateString = [g_dayDateFormatter stringFromDate:aDate];
	return localDateString;
}

+ (NSString *)timestampFromDate:(NSDate *)aDate {
	return [NSString stringWithFormat:@"%ld", (long)[aDate timeIntervalSince1970]];
}

+ (NSString *)stringFromTimestamp:(NSString *)timestamp format:(NSString *)dateFormat {
	if (timestamp.length >= 10) {
		NSString *timeString = [timestamp substringToIndex:10];
		NSDate *timeDate = [self dateFromTimestamp:timeString format:dateFormat];
		return [self stringFromDate:timeDate format:dateFormat];
	} else {
		NSDate *timeDate = [self dateFromTimestamp:timestamp format:dateFormat];
		return [self stringFromDate:timeDate format:dateFormat];
	}
}

+ (NSString *)timestampFromString:(NSString *)dateStr format:(NSString *)dateFormat {
	return [self timestampFromDate:[self dateFromString:dateStr format:dateFormat]];
}

+ (NSDate *)dateFromTimestamp:(NSString *)timestamp format:(NSString *)dateFormat {
	if (timestamp.length >= 10) {
		NSString *timeString = [timestamp substringToIndex:10];
		NSString *dateString = [self stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeString.doubleValue] format:dateFormat];
		return [self dateFromString:dateString format:dateFormat];
	} else {
		return nil;
	}
}

+ (NSDate *)dateFromString:(NSString *)dateStr format:(NSString *)dateFormat {
	return [self dateFromString:dateStr format:dateFormat timeZone:[NSTimeZone localTimeZone] dateLocale:[NSLocale localeWithLocaleIdentifier:@"zh_Hans_CN"]];
}

+ (NSDate *)dateFromString:(NSString *)dateStr format:(NSString *)dateFormat timeZone:(NSTimeZone *)timeZone dateLocale:(NSLocale *)locale {
	[g_dayDateFormatter setDateFormat:dateFormat];
	[g_dayDateFormatter setTimeZone:timeZone];
	[g_dayDateFormatter setLocale:locale];
	NSDate *date = [g_dayDateFormatter dateFromString:dateStr];
	return date;
}

+ (NSString *)getAfterDayWithTodayDate:(NSDate *)todayDate afterDay:(NSInteger)afterDay {
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
	NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday |NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:todayDate];
	[components setDay:([components day] + afterDay)];
	NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
	NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
	[dateday setDateFormat:@"yyyy-MM-dd"];
	return [dateday stringFromDate:beginningOfWeek];
}

#pragma mark ------------- Date End --------------

@end
