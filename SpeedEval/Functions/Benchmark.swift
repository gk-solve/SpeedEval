/*
 *  FILENAME : Benchmark.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : Runs every implementation several times and summarises the timings.
 *          Single runs are noisy (CPU frequency scaling, caches, other processes) : the median of several
 *          rounds, after a few discarded warm-up rounds, is far more stable.
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation

/*-----------------------------------------*/

/// The four Fisher-Yates variants compared by the app.
enum Implementation: CaseIterable
{
    case cpp, objCPP, objC, swift

    var title: String
    {
        switch self
        {
        case .cpp: return "C++"
        case .objCPP: return "ObjC++"
        case .objC: return "ObjC"
        case .swift: return "Swift"
        }
    }

    /// Runs the variant once and returns its timing with the checksum of the permutation it produced.
    func run(count: Int, seed: UInt64) -> (seconds: Double, checksum: UInt64)
    {
        var checksum: UInt64 = 0
        let seconds: Double

        switch self
        {
        case .cpp: seconds = NumbersSeriesObjCPP.fisherYatesAlgoCPP(Int32(count), seed: seed, checksum: &checksum)
        case .objCPP: seconds = NumbersSeriesObjCPP.fisherYatesAlgoObjCPP(Int32(count), seed: seed, checksum: &checksum)
        case .objC: seconds = NumbersSeriesObjC.fisherYatesAlgoObjC(Int32(count), seed: seed, checksum: &checksum)
        case .swift: return NumbersSeriesSwift.fisherYatesAlgoSWIFT(count: count, seed: seed)
        }
        return (seconds, checksum)
    }
}

/*-----------------------------------------*/

/// Summary of the measured rounds of one implementation.
struct BenchmarkStats
{
    let median: Double
    let best: Double

    init(samples: [Double])
    {
        let sorted = samples.sorted()
        let middle = sorted.count / 2
        median = sorted.count % 2 == 0 ? (sorted[middle - 1] + sorted[middle]) / 2 : sorted[middle]
        best = sorted[0]
    }
}

struct BenchmarkReport
{
    let stats: [Implementation: BenchmarkStats]
    /// False if, in any round, two implementations produced different permutations from the same seed.
    let checksumsMatch: Bool
}

/*-----------------------------------------*/

enum Benchmark
{
    /// Large enough for the timings (about 1 ms in C++) to stand well above the clock and scheduling noise :
    /// with 100.000 elements, the same C++ run varied by up to 10x from one launch to another.
    static let elementCount = 1_000_000
    static let warmUpRounds = 2
    static let measuredRounds = 15

    /// Blocking : call it off the main thread.
    static func run(elementCount: Int = elementCount,
                    warmUpRounds: Int = warmUpRounds,
                    measuredRounds: Int = measuredRounds) -> BenchmarkReport
    {
        precondition(measuredRounds > 0, "At least one measured round is needed")

        var samples: [Implementation: [Double]] = [:]
        var checksumsMatch = true

        for round in 0 ..< warmUpRounds + measuredRounds
        {
            /* A fresh seed per round, shared by all implementations of that round. */
            let seed = UInt64.random(in: .min ... .max)
            var roundChecksums = Set<UInt64>()

            /* The order is shuffled every round, so that no implementation is always the one running first
             * (cold caches) or last (CPU already warmed up / throttled). */
            for implementation in Implementation.allCases.shuffled()
            {
                let result = implementation.run(count: elementCount, seed: seed)
                roundChecksums.insert(result.checksum)
                if round >= warmUpRounds { samples[implementation, default: []].append(result.seconds) }
            }

            if roundChecksums.count != 1 { checksumsMatch = false }
        }

        return BenchmarkReport(stats: samples.mapValues(BenchmarkStats.init(samples:)), checksumsMatch: checksumsMatch)
    }
}
