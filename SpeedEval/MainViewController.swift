//
//  MainViewController.swift
//  SpeedEval
//
//  Created by GK on 09/05/2021.
//

import Foundation
import UIKit
import CoreGraphics


class MainViewController: UIViewController {

    let CaseOneOBJCPP = UILabel()
    let CaseOneCPP = UILabel()
    let CaseOneSWIFT = UILabel()
    let CaseTwoOBJCPP = UILabel()
    let CaseTwoCPP = UILabel()
    let CaseTwoSWIFT = UILabel()
    let CaseThreeSWIFT = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        /*-------------------------------------------------------------------------------------------------------------------------------*/

        self.createInterface()
        
        self.generateListsAndStats()

        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* Test 1 */
        //NumbersSeriesWrapper().printRandomFromCPP()
        //NumbersSeriesWrapper().printRandomFromObjCPP()
    }
    
    func createInterface()
    {
        /* Background color */
        self.view.backgroundColor = UIColor.lightGray
        
        var rowRank:CGFloat = 3
        let lineHeight:CGFloat = 30
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        let updateButton = UIButton()
        updateButton.frame = CGRect(x:15, y:rowRank*lineHeight, width:self.view.frame.size.width-2*15, height:1*lineHeight)
        updateButton.layer.backgroundColor = UIColor.blue.cgColor
        updateButton.setTitle("Update", for: UIControl.State.normal)
        self.view.addSubview(updateButton)
        
        updateButton.addTarget(self, action: #selector(generateListsAndStats), for: UIControl.Event.touchUpInside)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 2
        
        /* CASE 1 : OBJCPP */
        CaseOneOBJCPP.frame = CGRect(x:20, y:rowRank*lineHeight, width:self.view.frame.size.width-2*20, height:1*lineHeight)
        CaseOneOBJCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseOneOBJCPP)
                
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE 1 : CPP */
        CaseOneCPP.frame = CGRect(x:20, y:rowRank*lineHeight, width:self.view.frame.size.width-2*20, height:1*lineHeight)
        CaseOneCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseOneCPP)
                
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE 1 : SWIFT */
        CaseOneSWIFT.frame = CGRect(x:20, y:rowRank*lineHeight, width:self.view.frame.size.width-2*20, height:1*lineHeight)
        CaseOneSWIFT.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseOneSWIFT)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 2
        
        /* CASE2 : OBJCPP */
        CaseTwoOBJCPP.frame = CGRect(x:20, y:rowRank*lineHeight, width:self.view.frame.size.width-2*20, height:1*lineHeight)
        CaseTwoOBJCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseTwoOBJCPP)
                
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE2 : CPP */
        CaseTwoCPP.frame = CGRect(x:20, y:rowRank*lineHeight, width:self.view.frame.size.width-2*20, height:1*lineHeight)
        CaseTwoCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseTwoCPP)
                
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 1
        
        /* CASE2 : SWIFT */
        CaseTwoSWIFT.frame = CGRect(x:20, y:rowRank*lineHeight, width:self.view.frame.size.width-2*20, height:1*lineHeight)
        CaseTwoSWIFT.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseTwoSWIFT)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        rowRank = rowRank + 2
        
        /* CASE3 : SWIFT */
        CaseThreeSWIFT.frame = CGRect(x:20, y:rowRank*lineHeight, width:self.view.frame.size.width-2*20, height:1*lineHeight)
        CaseThreeSWIFT.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseThreeSWIFT)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
    }
    
    @objc func generateListsAndStats()
    {
        let topInt:Int = 100
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* CASE 1 : OBJCPP */
        
        let objcppElapsedTimeOne:Double = Double(NumbersSeriesObjCPP().getTimeElapsedOBJCPP(forRandomListGeneration: Int32(topInt), inCase: 1))
        CaseOneOBJCPP.text = String(format: "Case1 : %.6f sec | OBJC++", objcppElapsedTimeOne)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* CASE 1 : CPP */
        
        let cppElapsedTimeOne:Double = Double(NumbersSeriesObjCPP().getTimeElapsedCPP(forRandomListGeneration: Int32(topInt), inCase: 1))
        CaseOneCPP.text = String(format: "Case1 : %.6f sec | C++ (x%.2f)", cppElapsedTimeOne, cppElapsedTimeOne/objcppElapsedTimeOne)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
                
        /* CASE 1 : SWIFT */
        
        let swiftElapsedTimeOne:Double = Double(NumbersSeriesSwift().getTimeElapsedSWIFTForRandomListGeneration(max: topInt, algoCase: 1))
        CaseOneSWIFT.text = String(format: "Case1 : %.6f sec | SWIFT (x%.2f)", swiftElapsedTimeOne,swiftElapsedTimeOne/objcppElapsedTimeOne)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
                
        /* CASE2 : OBJCPP */
        
        let objcppElapsedTimeTwo:Double = Double(NumbersSeriesObjCPP().getTimeElapsedOBJCPP(forRandomListGeneration: Int32(topInt), inCase: 2))
        CaseTwoOBJCPP.text = String(format: "Case2 : %.6f sec | OBJC++", objcppElapsedTimeTwo)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* CASE 2 : CPP */
        
        let cppElapsedTimeTwo:Double = Double(NumbersSeriesObjCPP().getTimeElapsedCPP(forRandomListGeneration: Int32(topInt), inCase: 2))
        CaseTwoCPP.text = String(format: "Case2 : %.6f sec | C++ (x%.2f)", cppElapsedTimeTwo, cppElapsedTimeTwo/objcppElapsedTimeTwo)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
                
        /* CASE2 : SWIFT */
                
        let swiftElapsedTimeTwo:Double = Double(NumbersSeriesSwift().getTimeElapsedSWIFTForRandomListGeneration(max: topInt, algoCase: 2))
        CaseTwoSWIFT.text = String(format: "Case2 : %.6f sec | SWIFT (x%.2f)", swiftElapsedTimeTwo,swiftElapsedTimeTwo/objcppElapsedTimeTwo)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
                
        /* CASE3 : SWIFT */
        
        let swiftElapsedTimeThree:Double = Double(NumbersSeriesSwift().getTimeElapsedSWIFTForRandomListGeneration(max: topInt, algoCase: 3))
        CaseThreeSWIFT.text = String(format: "Case3 : %.6f sec | SWIFT", swiftElapsedTimeThree)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        
    }
}


