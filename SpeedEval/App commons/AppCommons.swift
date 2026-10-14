/*
 *  FILENAME : AppCommons.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  LAST UPDATE : 2026, October 13th
 *  NOTES : Singleton holding the objects shared across the app (for now, only the root view controller,
 *          installed as the window's rootViewController by AppDelegate).
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
