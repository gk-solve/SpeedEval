/*
 *  FILENAME : NumbersSeriesObjC.h
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 10th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumbersSeriesObjC : NSObject

/* Builds [0, 1, ..., count-1] as an NSMutableArray of NSNumber, shuffles it with Fisher-Yates seeded with `seed`,
 * writes the checksum of the permutation into `checksum` and returns the elapsed time in seconds. */
+(double)fisherYatesAlgoObjC:(int)count seed:(uint64_t)seed checksum:(uint64_t *)checksum;

@end

NS_ASSUME_NONNULL_END
