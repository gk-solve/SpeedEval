//
//  NumbersSeriesSwift.swift
//  SpeedEval
//
//  Created by WESTOWN on 09/05/2021.
//

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
                    if i>0 {for j in 0..<i{if randomArray[j] == randomNumber{includedYet = true}}}
                case 3:
                    randomNumber = Int.random(in: 0..<max)
                    includedYet = false
                    if randomArray.contains(randomNumber){includedYet = true}
                default:
                    includedYet = false
                }
                
            }
            while includedYet == true;
            
            randomArray.append(randomNumber)
            print(randomArray[i])
        }
        
        let endTime = Date()
        print("SWIFT_END : " + formatter.string(from: endTime))
                
        return Date().timeIntervalSince(startTime)
    }
    
}
