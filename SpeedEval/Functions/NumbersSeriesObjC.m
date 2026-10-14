/*
 *  FILENAME : NumbersSeriesObjC.m
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 10th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : Idiomatic Objective-C : the values live in an NSMutableArray of NSNumber objects.
 *          The cost of that boxing and of message sending is precisely what this variant measures.
 *          A plain C array would run as fast as C++ (ObjC is a strict superset of C), but it would no longer be
 *          idiomatic Objective-C : like every other variant, this one uses its language's usual data structures.
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import "NumbersSeriesObjC.h"

#include <time.h>

/*-----------------------------------------*/
/* SplitMix64 - must stay identical to the C++ (NumbersSeriesCPP.hpp) and Swift (NumbersSeriesSwift.swift) versions. */
static inline uint64_t splitMix64Next(uint64_t *state)
{
    uint64_t z = (*state += 0x9E3779B97F4A7C15ULL);
    z = (z ^ (z >> 30)) * 0xBF58476D1CE4E5B9ULL;
    z = (z ^ (z >> 27)) * 0x94D049BB133111EBULL;
    return z ^ (z >> 31);
}

/*-----------------------------------------*/

@implementation NumbersSeriesObjC

+(double)fisherYatesAlgoObjC:(int)count seed:(uint64_t)seed checksum:(uint64_t *)checksum
{
    uint64_t rngState = seed;

    /*-----------------------------------------*/
    /* START POINT - same monotonic clock as C++ and Swift (NSDate is wall-clock time and can jump). */
    const uint64_t start = clock_gettime_nsec_np(CLOCK_UPTIME_RAW);
    /*-----------------------------------------*/

    NSMutableArray<NSNumber *> *straightArray = [[NSMutableArray alloc] initWithCapacity:(NSUInteger)MAX(count, 0)];
    for (int k = 0; k < count; ++k) { [straightArray addObject:@(k)]; }

    for (int i = count - 1; i > 0; --i)
    {
        const NSUInteger j = (NSUInteger)(splitMix64Next(&rngState) % (uint64_t)(i + 1));
        [straightArray exchangeObjectAtIndex:(NSUInteger)i withObjectAtIndex:j];
    }

    /*-----------------------------------------*/
    /* END POINT */
    const uint64_t end = clock_gettime_nsec_np(CLOCK_UPTIME_RAW);
    /*-----------------------------------------*/

    /* Same formula as shuffleChecksum() in NumbersSeriesCPP.hpp. */
    uint64_t sum = 0;
    uint64_t position = 1;
    for (NSNumber *value in straightArray) { sum += position++ * (uint64_t)value.intValue; }
    *checksum = sum;

    return (double)(end - start) / 1e9;
}

@end
