/*
 *  FILENAME : SpeedEvalTests.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : A benchmark is only worth something if every implementation computes the same, correct thing.
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import XCTest
@testable import SpeedEval

final class SpeedEvalTests: XCTestCase
{
    /// The result must contain every value of [0, count) exactly once, including in the edge cases.
    func testShuffleIsAPermutation()
    {
        for count in [0, 1, 2, 3, 10, 10_000]
        {
            let shuffled = NumbersSeriesSwift.fisherYatesShuffled(count: count, seed: 2021)
            XCTAssertEqual(shuffled.sorted(), Array(0..<Int32(count)), "count = \(count)")
        }
    }

    /// Same seed => same permutation, whatever the language.
    func testAllLanguagesProduceTheSamePermutation()
    {
        for seed: UInt64 in [0, 1, 42, .max]
        {
            for count in [0, 1, 2, 1_000]
            {
                let checksums = Implementation.allCases.map { $0.run(count: count, seed: seed).checksum }
                XCTAssertEqual(Set(checksums).count, 1, "seed = \(seed), count = \(count) : \(checksums)")
            }
        }
    }

    /// Fisher-Yates must make all n! orders equally likely. A classic bug (drawing j in [0, i) instead of [0, i])
    /// still yields valid permutations but skews the distribution : with 3 elements, each of the 6 orders
    /// must show up about 1/6 of the time.
    func testShuffleIsUniform()
    {
        let trials = 60_000
        var occurrences: [[Int32]: Int] = [:]
        for seed in 0 ..< UInt64(trials)
        {
            occurrences[NumbersSeriesSwift.fisherYatesShuffled(count: 3, seed: seed), default: 0] += 1
        }

        XCTAssertEqual(occurrences.count, 6)
        let expected = Double(trials) / 6
        for (order, count) in occurrences
        {
            XCTAssertEqual(Double(count), expected, accuracy: expected * 0.05, "order \(order)")
        }
    }

    func testBenchmarkReportsEveryImplementation()
    {
        let report = Benchmark.run(elementCount: 1_000, warmUpRounds: 0, measuredRounds: 3)
        XCTAssertTrue(report.checksumsMatch)
        XCTAssertEqual(Set(report.stats.keys), Set(Implementation.allCases))
        for stats in report.stats.values { XCTAssertLessThanOrEqual(stats.best, stats.median) }
    }

    func testMedian()
    {
        XCTAssertEqual(BenchmarkStats(samples: [3, 1, 2]).median, 2)
        XCTAssertEqual(BenchmarkStats(samples: [4, 1, 3, 2]).median, 2.5)
        XCTAssertEqual(BenchmarkStats(samples: [4, 1, 3, 2]).best, 1)
    }
}
