/*
 *  FILENAME : AppCommons.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : -
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

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
