//
//  ZLUtil.h
//  ZLLibraryDemo
//
//  Created by PhilWang on 2019/6/21.
//  Copyright © 2019 ZHELIHENKU. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLUtil : NSObject

+ (NSString *)getNewTimestamp;

+ (NSString *)getTimestampFromUTC;

/**
 *  根据某一时间返回据当前时间多少前
 */
+ (NSString *)timeToText:(NSDate *)time;

/**
 *  格式化时间转成字符串
 *
 *  @param aDate      时间
 *  @param dateFormat 时间格式
 *
 *  @return 时间字符串
 */
+ (NSString *)stringFromDate:(NSDate *)aDate format:(NSString *)dateFormat;

+ (NSString *)stringFromDate:(NSDate *)aDate format:(NSString *)dateFormat timeZone:(NSTimeZone *)timeZone dateLocale:(NSLocale *)locale;

/**
 *  时间转化为时间戳
 *
 *  @param aDate 时间
 *
 *  @return 时间戳字符串
 */
+ (NSString *)timestampFromDate:(NSDate *)aDate;

/**
 *  时间戳字符串转化为时间字符串
 *
 *  @param timestamp  时间戳字符串
 *  @param dateFormat 时间格式
 *
 *  @return 时间字符串
 */
+ (NSString *)stringFromTimestamp:(NSString *)timestamp format:(NSString *)dateFormat;

/**
 *  时间字符串转化为时间戳字符串
 *
 *  @param dateStr  时间字符串
 *  @param dateFormat 时间格式
 *
 *  @return 时间戳字符串
 */
+ (NSString *)timestampFromString:(NSString *)dateStr format:(NSString *)dateFormat;

/**
 *  时间戳字符串转化为时间
 *
 *  @param timestamp  时间戳字符串
 *  @param dateFormat 时间格式
 *
 *  @return 时间
 */
+ (NSDate *)dateFromTimestamp:(NSString *)timestamp format:(NSString *)dateFormat;

/**
 *  时间字符串转化为时间
 *
 *  @param dateStr    时间字符串
 *  @param dateFormat 时间
 *
 *  @return 时间
 */
+ (NSDate *)dateFromString:(NSString *)dateStr format:(NSString *)dateFormat;

+ (NSDate *)dateFromString:(NSString *)dateStr format:(NSString *)dateFormat timeZone:(NSTimeZone *)timeZone dateLocale:(NSLocale *)locale;

+ (NSString *)getAfterDayWithTodayDate:(NSDate *)todayDate afterDay:(NSInteger)afterDay;

@end

NS_ASSUME_NONNULL_END
