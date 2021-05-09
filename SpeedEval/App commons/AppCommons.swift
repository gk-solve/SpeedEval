//
//  AppCommons.swift
//  SpeedEval
//
//  Created by GK on 09/05/2021.
//

import Foundation

class AppCommons
{
    //------------------------------------------//
    /* Commons - ViewController */
            
    let mainViewController = MainViewController()
    
    //------------------------------------------//
    
    static let shared = AppCommons()
    private init(){}
    
}
