//
//  AppDelegate.swift
//  mashro3k
//
//  Created by Deu desu ~~ on 4/21/18.
//  Copyright © 2018 EsraaEldaltony. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
import DropDown
import FBSDKCoreKit
import GoogleSignIn


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {
    
 
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //keyboard
//        IQKeyboardManager.sharedManager().enable = true
        
        //dropdown
        DropDown.startListeningToKeyboard()

        UINavigationBar.appearance().tintColor = UIColor.white
        FirebaseApp.configure()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: options[.sourceApplication] as? String, annotation: options[.annotation]) ||  GIDSignIn.sharedInstance().handle(url,
                                                                                                                                                                                                                                             sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                                                                                                                                                                                                             annotation: [:])
        // Add any custom logic here.
        return handled
    }
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation) || GIDSignIn.sharedInstance().handle(url,
                                                                                                                                                                                                             sourceApplication: sourceApplication,
                                                                                                                                                                                                             annotation: annotation)
        // Add any custom logic here.
        return handled
    }


    
//    @available(iOS 9.0, *)
//    func application(_ application: UIApplication, openURL url: URL, sourceApplication: String?, annotation: AnyObject) -> Bool {
//        let dynamicLink = FIRDynamicLinks.dynamicLinks()?.dynamicLink(fromCustomSchemeURL: url)
//        if let dynamicLink = dynamicLink {
//            
//            return true
//        }else{
//            return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation) || GIDSignIn.sharedInstance().handle(url,
//                                                                                                                                                                                                    sourceApplication: sourceApplication,
//                                                                                                                                                                                                    annotation: annotation)
//        }
//        
//    }
//    // ios 10
//    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
//        let dynamicLink = FIRDynamicLinks.dynamicLinks()?.dynamicLink(fromCustomSchemeURL: url)
//        if let dynamicLink = dynamicLink {
//            
//            return true
//        }else{
//            return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
//                || GIDSignIn.sharedInstance().handle(url as URL!,
//                                                     sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
//                                                     annotation: options[UIApplicationOpenURLOptionsKey.annotation])
//        }
//    }


}

