//
//  AppDelegate.swift
//  todoapp
//
//  Created by Hirose Tatsuya on 2014/07/06.
//  Copyright (c) 2014年 Tatsuya Hirose. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window!.rootViewController = TodoTableViewController()
        
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }

}

