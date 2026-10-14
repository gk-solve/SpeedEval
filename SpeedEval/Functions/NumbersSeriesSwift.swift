/*
 *  FILENAME : NumbersSeriesSwift.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : Swift arrays are copy-on-write value types with bounds checking : that safety cost is part of what
 *          this variant measures. Elements are Int32 to match the 4-byte C `int` used by the C++ versions.
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation

/*-----------------------------------------*/
/* SplitMix64 - must stay identical to the C++ (NumbersSeriesCPP.hpp) and ObjC (NumbersSeriesObjC.m) versions.
 * `&+` and `&*` are Swift's wrapping operators : they overflow silently, like unsigned C arithmetic,
 * where `+` and `*` would trap. */
struct SplitMix64
{
    private var state: UInt64

    init(seed: UInt64) { state = seed }

    mutating func next() -> UInt64
    {
        state &+= 0x9E3779B97F4A7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58476D1CE4E5B9
        z = (z ^ (z >> 27)) &* 0x94D049BB133111EB
        return z ^ (z >> 31)
    }
}

/*-----------------------------------------*/

enum NumbersSeriesSwift
{
    /// Builds [0, 1, ..., count-1] and shuffles it with Fisher-Yates seeded with `seed`.
    static func fisherYatesShuffled(count: Int, seed: UInt64) -> [Int32]
    {
        var rng = SplitMix64(seed: seed)
        var straightArray = Array(0..<Int32(max(count, 0)))

        /* stride(...) is empty when count < 2, where the former `(1 ... maxnumber-1)` range trapped. */
        for i in stride(from: straightArray.count - 1, to: 0, by: -1)
        {
            let j = Int(rng.next() % UInt64(i + 1))
            straightArray.swapAt(i, j)
        }
        return straightArray
    }

    /// Same checksum as `shuffleChecksum()` in NumbersSeriesCPP.hpp.
    static func checksum(of values: [Int32]) -> UInt64
    {
        var sum: UInt64 = 0
        for (k, value) in values.enumerated() { sum &+= UInt64(k + 1) &* UInt64(value) }
        return sum
    }

    /// Times `fisherYatesShuffled` and returns the elapsed seconds with the checksum of the permutation.
    static func fisherYatesAlgoSWIFT(count: Int, seed: UInt64) -> (seconds: Double, checksum: UInt64)
    {
        /*-----------------------------------------*/
        /* START POINT - same monotonic clock as C++ and ObjC. */
        let start = clock_gettime_nsec_np(CLOCK_UPTIME_RAW)
        /*-----------------------------------------*/

        let shuffled = fisherYatesShuffled(count: count, seed: seed)

        /*-----------------------------------------*/
        /* END POINT */
        let end = clock_gettime_nsec_np(CLOCK_UPTIME_RAW)
        /*-----------------------------------------*/

        return (Double(end - start) / 1e9, checksum(of: shuffled))
    }
}
