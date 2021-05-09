//
//  MainViewController.swift
//  SpeedEval
//
//  Created by WESTOWN on 09/05/2021.
//

import Foundation
import UIKit
import CoreGraphics


class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.view.backgroundColor = UIColor.blue
        
        let resultLabel = UILabel()
        resultLabel.frame = CGRect(x:CGFloat(self.view.frame.size.width/2 - 100), y:50, width:200, height:20)
        resultLabel.textColor = UIColor.white
        resultLabel.textAlignment = NSTextAlignment.center
        resultLabel.text = "Result"
        self.view.addSubview(resultLabel)
        
    }


}
