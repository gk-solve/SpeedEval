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
    
    let CaseExtraOBJC = UILabel()
    let CaseExtraSWIFT = UILabel()
    let CaseExtraCPP = UILabel()
    let CaseExtraObjCPP = UILabel()
    
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
        
        rowRank = rowRank + 1
        
        /* CASE3 : OBJCPP */
        CaseExtraObjCPP.frame = CGRect(x:dim, y:rowRank*dim, width:self.view.frame.size.width-2*20, height:1*dim)
        CaseExtraObjCPP.textAlignment = NSTextAlignment.left
        self.view.addSubview(CaseExtraObjCPP)
        
        /*-------------------------------------------------------------------------------------------------------------------------------*/
    }
        
    @objc func generateListsAndStats()
    {
        activity.startAnimating()
        
        let topInt:Int = 100000

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
        
        // CASE3 : OBJCPP //
        
        let objcppElapsedTimeExtra:Double = Double(NumbersSeriesObjCPP().fisherYatesAlgoObjCPP(Int32(topInt)))
        CaseExtraObjCPP.text = String(format: "CaseE : %.6f sec | OBJCPP", objcppElapsedTimeExtra)
        
        //-------------------------------------------------------------------------------------------------------------------------------//
        
        activity.stopAnimating()
    }
}


