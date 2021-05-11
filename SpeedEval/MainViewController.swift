/*
 *  FILENAME : MainViewController.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation
import UIKit
import CoreGraphics

class MainViewController: UIViewController {

    let activity = UIActivityIndicatorView()
    
    let CaseOneOBJCPP = UILabel()
    let CaseOneOBJC = UILabel()
    let CaseOneCPP = UILabel()
    let CaseOneSWIFT = UILabel()
    let CaseTwoOBJCPP = UILabel()
    let CaseTwoOBJC = UILabel()
    let CaseTwoCPP = UILabel()
    let CaseTwoSWIFT = UILabel()
    let CaseThreeOBJC = UILabel()
    let CaseThreeSWIFT = UILabel()
    let CaseExtraOBJC = UILabel()
    let CaseExtraSWIFT = UILabel()
    let CaseExtraCPP = UILabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        /*-------------------------------------------------------------------------------------------------------------------------------*/

        self.createInterface()
        self.generateListsAndStats()
            
        /*-------------------------------------------------------------------------------------------------------------------------------*/
    }
    
    func createInterface()
    {
        /* Background color */
        self.view.backgroundColor = UIColor.lightGray
        
        var rowRank:CGFloat = 3
        let dim:CGFloat = 30
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        let updateButton = UIButton()
        updateButton.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*dim, height:1*dim)
        updateButton.setBackgroundImage(UIImage(named: "Bkg_Normal.png"), for: UIControl.State.normal)
        updateButton.setBackgroundImage(UIImage(named: "Bkg_Selected.png"), for: UIControl.State.highlighted)
        updateButton.setTitle("Run algorithms", for: UIControl.State.normal)
        self.view.addSubview(updateButton)
        
        updateButton.addTarget(self, action: #selector(generateListsAndStats), for: UIControl.Event.touchUpInside)
        
        activity.frame = CGRect(x:0,y:rowRank*dim, width:dim, height:dim)
        activity.hidesWhenStopped = true
        self.view.addSubview(activity)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 2
        
        /* CASE 1 : OBJCPP */
        CaseOneOBJCPP.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseOneOBJCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseOneOBJCPP)
                
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE 1 : OBJC */
        CaseOneOBJC.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseOneOBJC.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseOneOBJC)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE 1 : CPP */
        CaseOneCPP.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseOneCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseOneCPP)
                
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE 1 : SWIFT */
        CaseOneSWIFT.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseOneSWIFT.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseOneSWIFT)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 2
        
        /* CASE2 : OBJCPP */
        CaseTwoOBJCPP.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseTwoOBJCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseTwoOBJCPP)
                
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE 2 : OBJC */
        CaseTwoOBJC.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseTwoOBJC.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseTwoOBJC)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE2 : CPP */
        CaseTwoCPP.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseTwoCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseTwoCPP)
                
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE2 : SWIFT */
        CaseTwoSWIFT.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseTwoSWIFT.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseTwoSWIFT)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 2
        
        /* CASE3 : OBJC */
        CaseThreeOBJC.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseThreeOBJC.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseThreeOBJC)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE3 : SWIFT */
        CaseThreeSWIFT.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseThreeSWIFT.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseThreeSWIFT)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 2
        
        /* CASE3 : OBJC */
        CaseExtraOBJC.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseExtraOBJC.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseExtraOBJC)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE3 : SWIFT */
        CaseExtraSWIFT.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseExtraSWIFT.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseExtraSWIFT)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE3 : SWIFT */
        CaseExtraCPP.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*dim, height:1*dim)
        CaseExtraCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseExtraCPP)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
    }
        
    @objc func generateListsAndStats()
    {
        activity.startAnimating()
        
        let topInt:Int = 100000
        let all:Bool = false
        
        if all == true
        {

            //-------------------------------------------------------------------------------------------------------------------------------//
            //-------------------------------------------------------------------------------------------------------------------------------//
            
            // CASE 1 : OBJCPP //
        
            let objcppElapsedTimeOne:Double = Double(NumbersSeriesObjCPP().getTimeElapsedOBJCPP(forRandomListGeneration: Int32(topInt), inCase: 1))
            CaseOneOBJCPP.text = String(format: "Case1 : %.6f sec | OBJC++", objcppElapsedTimeOne)

            //-------------------------------------------------------------------------------------------------------------------------------//
            
            // CASE 1 : OBJC //
            
            let objcElapsedTimeOne:Double = Double(NumbersSeriesObjC().getTimeElapsedOBJC(forRandomListGeneration: Int32(topInt), inCase: 1))
            CaseOneOBJC.text = String(format: "Case1 : %.6f sec | OBJC (x%.2f)", objcElapsedTimeOne, objcElapsedTimeOne/objcppElapsedTimeOne)
            
            //-------------------------------------------------------------------------------------------------------------------------------//
            
            // CASE 1 : CPP //
            
            let cppElapsedTimeOne:Double = Double(NumbersSeriesObjCPP().getTimeElapsedCPP(forRandomListGeneration: Int32(topInt), inCase: 1))
            CaseOneCPP.text = String(format: "Case1 : %.6f sec | C++ (x%.2f)", cppElapsedTimeOne, cppElapsedTimeOne/objcppElapsedTimeOne)
            
            //-------------------------------------------------------------------------------------------------------------------------------//
                    
            // CASE 1 : SWIFT //
            
            let swiftElapsedTimeOne:Double = Double(NumbersSeriesSwift().getTimeElapsedSWIFTForRandomListGeneration(max: topInt, algoCase: 1))
            CaseOneSWIFT.text = String(format: "Case1 : %.6f sec | SWIFT (x%.2f)", swiftElapsedTimeOne,swiftElapsedTimeOne/objcppElapsedTimeOne)
            
            //-------------------------------------------------------------------------------------------------------------------------------//
            //-------------------------------------------------------------------------------------------------------------------------------//
                    
            // CASE2 : OBJCPP //
            
            let objcppElapsedTimeTwo:Double = Double(NumbersSeriesObjCPP().getTimeElapsedOBJCPP(forRandomListGeneration: Int32(topInt), inCase: 2))
            CaseTwoOBJCPP.text = String(format: "Case2 : %.6f sec | OBJC++", objcppElapsedTimeTwo)
            
            //-------------------------------------------------------------------------------------------------------------------------------//
            
            // CASE 2 : OBJC //
            
            let objcElapsedTimeTwo:Double = Double(NumbersSeriesObjC().getTimeElapsedOBJC(forRandomListGeneration: Int32(topInt), inCase: 2))
            CaseTwoOBJC.text = String(format: "Case2 : %.6f sec | OBJC (x%.2f)", objcElapsedTimeTwo, objcElapsedTimeTwo/objcppElapsedTimeTwo)
            
            //-------------------------------------------------------------------------------------------------------------------------------//
            
            // CASE 2 : CPP //
            
            let cppElapsedTimeTwo:Double = Double(NumbersSeriesObjCPP().getTimeElapsedCPP(forRandomListGeneration: Int32(topInt), inCase: 2))
            CaseTwoCPP.text = String(format: "Case2 : %.6f sec | C++ (x%.2f)", cppElapsedTimeTwo, cppElapsedTimeTwo/objcppElapsedTimeTwo)
            
            //-------------------------------------------------------------------------------------------------------------------------------//
                    
            // CASE2 : SWIFT //
                    
            let swiftElapsedTimeTwo:Double = Double(NumbersSeriesSwift().getTimeElapsedSWIFTForRandomListGeneration(max: topInt, algoCase: 2))
            CaseTwoSWIFT.text = String(format: "Case2 : %.6f sec | SWIFT (x%.2f)", swiftElapsedTimeTwo,swiftElapsedTimeTwo/objcppElapsedTimeTwo)
            
            //-------------------------------------------------------------------------------------------------------------------------------//
            //-------------------------------------------------------------------------------------------------------------------------------//
                   
            // CASE3 : OBJC //
            
            let objcElapsedTimeThree:Double = Double(NumbersSeriesObjC().getTimeElapsedOBJC(forRandomListGeneration: Int32(topInt), inCase: 3))
            CaseThreeOBJC.text = String(format: "Case3 : %.6f sec | OBJC", objcElapsedTimeThree)
            
            //-------------------------------------------------------------------------------------------------------------------------------//
            
            // CASE3 : SWIFT //
            
            let swiftElapsedTimeThree:Double = Double(NumbersSeriesSwift().getTimeElapsedSWIFTForRandomListGeneration(max: topInt, algoCase: 3))
            CaseThreeSWIFT.text = String(format: "Case3 : %.6f sec | SWIFT", swiftElapsedTimeThree)
        }
            
        //-------------------------------------------------------------------------------------------------------------------------------//
        //-------------------------------------------------------------------------------------------------------------------------------//
               
        // CASE3 : OBJC //
        
        let objcElapsedTimeExtra:Double = Double(NumbersSeriesObjC().fisherYatesAlgoObjC(Int32(topInt)))
        CaseExtraOBJC.text = String(format: "CaseE : %.6f sec | OBJC", objcElapsedTimeExtra)
        
        //-------------------------------------------------------------------------------------------------------------------------------//
        
        // CASE3 : SWIFT //
        
        let swiftElapsedTimeExtra:Double = Double(NumbersSeriesSwift().fisherYatesAlgoSWIFT(maxnumber: topInt))
        CaseExtraSWIFT.text = String(format: "CaseE : %.6f sec | SWIFT", swiftElapsedTimeExtra)
        
        //-------------------------------------------------------------------------------------------------------------------------------//
        
        // CASE3 : CPP //
        
        let cppElapsedTimeExtra:Double = Double(NumbersSeriesObjCPP().fisherYatesAlgoCPP(Int32(topInt)))
        CaseExtraCPP.text = String(format: "CaseE : %.6f sec | CPP", cppElapsedTimeExtra)
        
        //-------------------------------------------------------------------------------------------------------------------------------//
        
        activity.stopAnimating()
    }
}


