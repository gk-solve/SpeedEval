/*
 *  FILENAME : MainViewController.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : PURPOSE > Testing the speed of the Fisher-Yates algorithm to shuffle an array of 100.000 integers,
 *                    through 3 different languages: C++/ObjC++, ObjC, Swift
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import Foundation
import UIKit
import CoreGraphics

class MainViewController: UIViewController {

    let activity = UIActivityIndicatorView()
    
    let CaseResultCPP = UILabel()
    let CaseResultObjCPP = UILabel()
    let CaseResultOBJC = UILabel()
    let CaseResultSWIFT = UILabel()
    
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

        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* BASICS */
        self.view.backgroundColor = UIColor.lightGray
        let dim:CGFloat = self.view.frame.size.height/25
        let fontDim:CGFloat = 0.60*dim
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* INTRO */
        let Intro = UILabel()
        Intro.frame = CGRect(x:dim, y:0, width:self.view.frame.size.width-2*dim, height:self.view.center.y - 5*dim)
        Intro.textAlignment = NSTextAlignment.center
        Intro.text = "PURPOSE\rTesting the speed of the Fisher-Yates algorithm to shuffle an array of 100.000 integers, through 3 different languages:\rC++/ObjC++, ObjC, Swift"
        Intro.font = UIFont(name: "Verdana", size: 0.8*fontDim)
        Intro.textColor = UIColor.black
        Intro.numberOfLines = 0
        self.view.addSubview(Intro)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* CASE : C++ */
        let CaseCPP = UILabel()
        CaseCPP.frame = CGRect(x:dim, y:self.view.center.y - 5*dim, width:self.view.frame.size.width-2*dim, height:1*dim)
        CaseCPP.textAlignment = NSTextAlignment.center
        CaseCPP.text = "C++"
        CaseCPP.font = UIFont(name: "Verdana", size: fontDim)
        CaseCPP.textColor = UIColor.white
        self.view.addSubview(CaseCPP)
        
        CaseResultCPP.frame = CGRect(x:dim, y:self.view.center.y - 4*dim, width:self.view.frame.size.width-2*dim, height:1*dim)
        CaseResultCPP.textAlignment = NSTextAlignment.center
        CaseResultCPP.font = UIFont(name: "Verdana", size: fontDim)
        self.view.addSubview(CaseResultCPP)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* CASE : OBJC++ */
        let CaseObjCPP = UILabel()
        CaseObjCPP.frame = CGRect(x:dim, y:self.view.center.y - 2*dim, width:self.view.frame.size.width-2*dim, height:1*dim)
        CaseObjCPP.textAlignment = NSTextAlignment.center
        CaseObjCPP.text = "ObjC++"
        CaseObjCPP.font = UIFont(name: "Verdana", size: fontDim)
        CaseObjCPP.textColor = UIColor.white
        self.view.addSubview(CaseObjCPP)
        
        CaseResultObjCPP.frame = CGRect(x:dim, y:self.view.center.y - 1*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseResultObjCPP.textAlignment = NSTextAlignment.center
        CaseResultObjCPP.font = UIFont(name: "Verdana", size: fontDim)
        self.view.addSubview(CaseResultObjCPP)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        /* CASE : OBJC */
        let ObjC = UILabel()
        ObjC.frame = CGRect(x:dim, y:self.view.center.y + 1*dim, width:self.view.frame.size.width-2*dim, height:1*dim)
        ObjC.textAlignment = NSTextAlignment.center
        ObjC.text = "ObjC"
        ObjC.font = UIFont(name: "Verdana", size: fontDim)
        ObjC.textColor = UIColor.white
        self.view.addSubview(ObjC)
        
        CaseResultOBJC.frame = CGRect(x:dim, y:self.view.center.y + 2*dim, width:self.view.frame.size.width-2*20, height:dim)
        CaseResultOBJC.textAlignment = NSTextAlignment.center
        CaseResultOBJC.font = UIFont(name: "Verdana", size: fontDim)
        self.view.addSubview(CaseResultOBJC)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
    
        /* CASE : SWIFT */
        let Swift = UILabel()
        Swift.frame = CGRect(x:dim, y:self.view.center.y + 4*dim, width:self.view.frame.size.width-2*dim, height:1*dim)
        Swift.textAlignment = NSTextAlignment.center
        Swift.text = "Swift"
        Swift.font = UIFont(name: "Verdana", size: fontDim)
        Swift.textColor = UIColor.white
        self.view.addSubview(Swift)
        
        CaseResultSWIFT.frame = CGRect(x:dim, y:self.view.center.y + 5*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseResultSWIFT.textAlignment = NSTextAlignment.center
        CaseResultSWIFT.font = UIFont(name: "Verdana", size: fontDim)
        self.view.addSubview(CaseResultSWIFT)
    
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        activity.frame = CGRect(x:0,y:self.view.frame.height - 3*dim, width:dim, height:dim)
        activity.hidesWhenStopped = true
        self.view.addSubview(activity)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        
        let updateButton = UIButton()
        updateButton.frame = CGRect(x:dim, y:self.view.frame.height - 3.5*dim, width:self.view.frame.size.width-2*dim, height:1.5*dim)
        updateButton.setBackgroundImage(UIImage(named: "Bkg_Normal.png"), for: UIControl.State.normal)
        updateButton.setBackgroundImage(UIImage(named: "Bkg_Selected.png"), for: UIControl.State.highlighted)
        updateButton.setTitle("Run Fisher-Yates again", for: UIControl.State.normal)
        updateButton.setTitleColor(UIColor(named: "NewWhite"), for: UIControl.State.normal) /* Toogle dark mode : Cmd + Shift + A */
        updateButton.addTarget(self, action: #selector(generateListsAndStats), for: UIControl.Event.touchUpInside)
        self.view.addSubview(updateButton)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
        /*-------------------------------------------------------------------------------------------------------------------------------*/
    }
        
    @objc func generateListsAndStats()
    {
        let topInt:Int = 100000

        activity.startAnimating()
        
        //-------------------------------------------------------------------------------------------------------------------------------//
        /* C++ */
        let cppElapsedTimeResult:Double = Double(NumbersSeriesObjCPP().fisherYatesAlgoCPP(Int32(topInt)))
        CaseResultCPP.text = String(format: "%.6f sec (ref. time)", cppElapsedTimeResult)
        
        //-------------------------------------------------------------------------------------------------------------------------------//
        /* OBJC++ */
        let objcppElapsedTimeResult:Double = Double(NumbersSeriesObjCPP().fisherYatesAlgoObjCPP(Int32(topInt)))
        CaseResultObjCPP.text = String(format: "%.6f sec ( x %.2f )", objcppElapsedTimeResult, objcppElapsedTimeResult/cppElapsedTimeResult)
        
        //-------------------------------------------------------------------------------------------------------------------------------//
        /* OBJC */
        let objcElapsedTimeResult:Double = Double(NumbersSeriesObjC().fisherYatesAlgoObjC(Int32(topInt)))
        CaseResultOBJC.text = String(format: "%.6f sec ( x %.2f )", objcElapsedTimeResult, objcElapsedTimeResult/cppElapsedTimeResult)
        
        //-------------------------------------------------------------------------------------------------------------------------------//
        /* SWIFT */
        let swiftElapsedTimeResult:Double = Double(NumbersSeriesSwift().fisherYatesAlgoSWIFT(maxnumber: topInt))
        CaseResultSWIFT.text = String(format: "%.6f sec ( x %.2f )", swiftElapsedTimeResult, swiftElapsedTimeResult/cppElapsedTimeResult)
    
        //-------------------------------------------------------------------------------------------------------------------------------//
        
        activity.stopAnimating()
    }
}


