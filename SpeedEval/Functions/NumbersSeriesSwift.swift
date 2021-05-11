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
    func fisherYatesAlgoSWIFT(maxnumber : Int)->Double
    {
        /*-----------------------------------------*/
        /* START POINT */
        let startTime = Date()
        print ("SWIFT_FisherYates_START")
        /*-----------------------------------------*/
        
        var straightArray:[Int] = []
        for i:Int in 0..<maxnumber{straightArray.append(i)}
        
        for i in (1 ... maxnumber-1).reversed()
        {
            let j:Int = Int.random(in: 0..<i+1)
            straightArray.swapAt(i, j)
        }
    
        //for index in straightArray{print("shuffle (Fisher-Yates) - SWIFT : \(straightArray[index])")}
        
        /*-----------------------------------------*/
        /* END POINT */
        //let endTime = Date()
        print ("SWIFT_FisherYates_END")
        /*-----------------------------------------*/
        
        return Date().timeIntervalSince(startTime)
    }
}
