//
//  TemplateApp.swift
//  Template
//
//  Created by Domagoj Kulundzic on 24/05/2019.
//

import UIKit

@UIApplicationMain
class TemplateApp: UIResponder, UIApplicationDelegate {
  let window = UIWindow(frame: UIScreen.main.bounds)
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window.rootViewController = ExampleRouter.createModule(delegate: nil)
    window.makeKeyAndVisible()
    
    return true
  }
  
  func applicationWillResignActive(_ application: UIApplication) { }
  
  func applicationDidEnterBackground(_ application: UIApplication) { }
  
  func applicationWillEnterForeground(_ application: UIApplication) { }
  
  func applicationDidBecomeActive(_ application: UIApplication) { }
  
  func applicationWillTerminate(_ application: UIApplication) { }
}
