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

    override func viewDidLoad() {
        super.viewDidLoad()
       
        /* Background color */
        self.view.backgroundColor = UIColor.blue
        
        /* CPP label 1 */
        let cppLabelOne = UILabel()
        cppLabelOne.frame = CGRect(x:CGFloat(self.view.frame.size.width/2 - 100), y:50, width:200, height:20)
        cppLabelOne.textColor = UIColor.white
        cppLabelOne.textAlignment = NSTextAlignment.center
        cppLabelOne.text = "Result"
        self.view.addSubview(cppLabelOne)
        
        /* CPP label 2 */
        let cppLabelTwo = UILabel()
        cppLabelTwo.frame = CGRect(x:CGFloat(self.view.frame.size.width/2 - 100), y:100, width:200, height:20)
        cppLabelTwo.textColor = UIColor.white
        cppLabelTwo.textAlignment = NSTextAlignment.center
        cppLabelTwo.text = "Result"
        self.view.addSubview(cppLabelTwo)
        
        /* Test 1 */
        //NumbersSeriesWrapper().printRandomFromCPP()
        //NumbersSeriesWrapper().printRandomFromObjCPP()
        
        /* Test 2 */
        let elapsedTime:Double = Double(NumbersSeriesObjCPP().getTimeElapsed(forRandomListGeneration: 20000, inCase: 1))
        cppLabelOne.text = String(format: "%.6f sec", elapsedTime)
        
        let newElapsedTime:Double = Double(NumbersSeriesObjCPP().getTimeElapsed(forRandomListGeneration: 20000, inCase: 2))
        cppLabelTwo.text = String(format: "%.6f sec", newElapsedTime)
        
    }
}
