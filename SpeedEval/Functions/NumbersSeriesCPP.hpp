/*
 *  FILENAME : NumbersSeriesCPP.hpp
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 10th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : Pure C++ header. It is never seen by Swift: it is only included by NumbersSeriesCPP.cpp
 *          and NumbersSeriesObjCPP.mm (the ObjC++ bridge that Swift can call).
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

#ifndef NumbersSeriesCPP_hpp
#define NumbersSeriesCPP_hpp

#include <cstddef>
#include <cstdint>

/*-----------------------------------------*/
/* SplitMix64 - tiny, fast, deterministic pseudo-random generator.
 *
 * The very same generator is re-implemented in ObjC (NumbersSeriesObjC.m) and Swift (NumbersSeriesSwift.swift).
 * Using one generator everywhere matters for two reasons:
 *  - fairness : rand(), arc4random() and Int.random() have very different costs, and that cost used to dominate the timings ;
 *  - checking : for a given seed, every implementation must produce the exact same permutation (see shuffleChecksum).
 * Any change here must be mirrored in the two other languages. */
struct SplitMix64
{
    uint64_t state;

    explicit SplitMix64(uint64_t seed) : state(seed) {}

    uint64_t next()
    {
        uint64_t z = (state += 0x9E3779B97F4A7C15ULL);
        z = (z ^ (z >> 30)) * 0xBF58476D1CE4E5B9ULL;
        z = (z ^ (z >> 27)) * 0x94D049BB133111EBULL;
        return z ^ (z >> 31);
    }
};

/*-----------------------------------------*/
/* Checksum of a shuffled array : sum of (index + 1) * value, with unsigned (wrapping) arithmetic.
 * Being position-dependent, two arrays share the same checksum only if they hold the same permutation.
 * Reading the array also prevents the optimiser from discarding a shuffle whose result would be unused. */
inline uint64_t shuffleChecksum(const int *values, size_t count)
{
    uint64_t sum = 0;
    for (size_t k = 0; k < count; ++k) { sum += (uint64_t)(k + 1) * (uint64_t)values[k]; }
    return sum;
}

/*-----------------------------------------*/

class NumbersSeriesCPP
{
    public:
    /* Builds [0, 1, ..., count-1], shuffles it with Fisher-Yates and returns the elapsed time in seconds.
     * The checksum of the resulting permutation is written into `checksum`. */
    static double fisherYatesAlgoCPP(int count, uint64_t seed, uint64_t &checksum);
};

#endif
