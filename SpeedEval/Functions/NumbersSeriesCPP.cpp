/*
 *  FILENAME : NumbersSeriesCPP.cpp
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 10th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : Reference implementation : every other language is compared against this one.
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#include "NumbersSeriesCPP.hpp"

#include <time.h>
#include <utility>
#include <vector>

double NumbersSeriesCPP::fisherYatesAlgoCPP(int count, uint64_t seed, uint64_t &checksum)
{
    SplitMix64 rng(seed);

    /*-----------------------------------------*/
    /* START POINT
     * CLOCK_UPTIME_RAW is monotonic (unlike system_clock, it never jumps when the device time is adjusted).
     * The same clock is used in ObjC and Swift. Nothing is logged inside the timed window : console output is slow. */
    const uint64_t start = clock_gettime_nsec_np(CLOCK_UPTIME_RAW);
    /*-----------------------------------------*/

    /* Heap storage : the former `int array[n]` was a variable-length array, a non-standard extension
     * that lived on the thread stack and would crash for large counts. */
    std::vector<int> straightArray(count);
    for (int k = 0; k < count; ++k) { straightArray[k] = k; }

    /* Fisher-Yates : walk backwards, swap each slot with a random slot in [0, i].
     * The modulo bias is negligible here : (i + 1) <= 1.000.000 against a 64-bit random range. */
    for (int i = count - 1; i > 0; --i)
    {
        const int j = (int)(rng.next() % (uint64_t)(i + 1));
        std::swap(straightArray[i], straightArray[j]);
    }

    /*-----------------------------------------*/
    /* END POINT */
    const uint64_t end = clock_gettime_nsec_np(CLOCK_UPTIME_RAW);
    /*-----------------------------------------*/

    checksum = shuffleChecksum(straightArray.data(), straightArray.size());
    return (double)(end - start) / 1e9;
}
