/*
 *  FILENAME : NumbersSeriesSwift.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation

class NumbersSeriesSwift
{    
    func getTimeElapsedSWIFTForRandomListGeneration(max:Int, algoCase:Int)->Double
    {
        var randomArray:[Int] = []
        var boolArray:[Int] = []
        
        let startTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH.mm.ss.SSSS"
        print("SWIFT_START : " + formatter.string(from: startTime))
        
        for i in 0..<max
        {
            var includedYet:Bool = false
            var randomNumber:Int = 0
            
            repeat
            {
                switch algoCase {
                case 1:
                    randomNumber = Int.random(in: 0..<max)
                    includedYet = false
                    boolArray = []
                    if i>0 {for j in 0..<i{if randomArray[j] == randomNumber{boolArray.append(1)}else{boolArray.append(0)}}}
                        var sum:Int = 0
                        for k in 0..<i{sum = sum + boolArray[k]}
                        if sum>0{includedYet = true}else{includedYet = false}
                case 2:
                    randomNumber = Int.random(in: 0..<max)
                    includedYet = false
                    if i>0
                    {
                        for j in 0..<i
                        {
                            if randomArray[j] == randomNumber
                            {
                                includedYet = true
                                break
                            }
                        }
                    }
                case 3:
                    randomNumber = Int.random(in: 0..<max)
                    includedYet = false
                    if randomArray.contains(randomNumber){includedYet = true}
                default:
                    print("Default case")
                }
                
            }
            while includedYet == true;
            
            randomArray.append(randomNumber)
            //print(randomArray[i])
        }
        
        let endTime = Date()
        print("SWIFT_END : " + formatter.string(from: endTime))
                
        return Date().timeIntervalSince(startTime)
    }
    
    func generateSWIFTShuffledList(maxnumber:Int)->Double
    {
        var straightArray:[Int] = []
        for i:Int in 0..<maxnumber{straightArray.append(i)}
        let straightInitialCount = straightArray.count
        
        var randomArray:[Int] = []
        
        let startTime = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH.mm.ss.SSSS"
        print("SWIFT_START : " + formatter.string(from: startTime))
        
            for var j:Int in 0..<straightInitialCount
            {
                let randomPickedIndex:Int = Int.random(in: 0..<straightArray.count)
                randomArray.append(straightArray[randomPickedIndex])
                straightArray.remove(at: randomPickedIndex)
                
                j+=1
            }
                
        let endTime = Date()
        print("SWIFT_END : " + formatter.string(from: endTime))
                
        return Date().timeIntervalSince(startTime)
    }
}
