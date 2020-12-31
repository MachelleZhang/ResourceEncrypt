//
//  AppDelegate.swift
//  TestDecryptResourceSwift
//
//  Created by ZhangLe on 2020/7/9.
//  Copyright © 2020 AsiaInfo Mobile. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let mainVC = ViewController()
        window?.rootViewController = mainVC
        
        window?.makeKeyAndVisible()
        
        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")!.load()
        
        return true
    }

}

