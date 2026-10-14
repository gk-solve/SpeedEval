/*
 *  FILENAME : NumbersSeriesObjCPP.mm
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : The ObjC++ variant is deliberately the same code as the C++ one, compiled by the same clang.
 *          It acts as a control : any gap between "C++" and "ObjC++" is measurement noise, which gives
 *          a sense of how much the other gaps can be trusted.
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import "NumbersSeriesObjCPP.h"
#import "NumbersSeriesCPP.hpp"

#include <time.h>
#include <utility>
#include <vector>

@implementation NumbersSeriesObjCPP

+(double)fisherYatesAlgoObjCPP:(int)count seed:(uint64_t)seed checksum:(uint64_t *)checksum
{
    SplitMix64 rng(seed);

    /*-----------------------------------------*/
    /* START POINT */
    const uint64_t start = clock_gettime_nsec_np(CLOCK_UPTIME_RAW);
    /*-----------------------------------------*/

    std::vector<int> straightArray(count);
    for (int k = 0; k < count; ++k) { straightArray[k] = k; }

    for (int i = count - 1; i > 0; --i)
    {
        const int j = (int)(rng.next() % (uint64_t)(i + 1));
        std::swap(straightArray[i], straightArray[j]);
    }

    /*-----------------------------------------*/
    /* END POINT */
    const uint64_t end = clock_gettime_nsec_np(CLOCK_UPTIME_RAW);
    /*-----------------------------------------*/

    *checksum = shuffleChecksum(straightArray.data(), straightArray.size());
    return (double)(end - start) / 1e9;
}

+(double)fisherYatesAlgoCPP:(int)count seed:(uint64_t)seed checksum:(uint64_t *)checksum
{
    return NumbersSeriesCPP::fisherYatesAlgoCPP(count, seed, *checksum);
}

@end
