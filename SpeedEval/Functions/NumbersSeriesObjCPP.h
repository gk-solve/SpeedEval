/*
 *  FILENAME : NumbersSeriesObjCPP.h
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : Swift cannot call C++ directly (with this project setup) : this ObjC interface is the bridge.
 *          It stays free of any C++ type so that it can be imported through the bridging header.
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumbersSeriesObjCPP : NSObject

/* Both methods build [0, 1, ..., count-1], shuffle it with Fisher-Yates seeded with `seed`,
 * write the checksum of the permutation into `checksum` and return the elapsed time in seconds. */

/* Algorithm written inline in this .mm file. */
+(double)fisherYatesAlgoObjCPP:(int)count seed:(uint64_t)seed checksum:(uint64_t *)checksum;

/* Forwards to the pure C++ implementation (NumbersSeriesCPP.cpp). */
+(double)fisherYatesAlgoCPP:(int)count seed:(uint64_t)seed checksum:(uint64_t *)checksum;

@end

NS_ASSUME_NONNULL_END
