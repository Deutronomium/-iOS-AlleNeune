//
//  AppDelegate.swift
//  AlleNeune
//
//  Created by Patrick Engelkes on 03/03/15.
//  Copyright (c) 2015 Patrick Engelkes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var clubHomeController: UITabBarController?
    var loginNavigationController: UINavigationController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //hide navigation bar from navigation controller
        application.statusBarHidden = true
        //login view controller to start with
        let loginController = LoginController(nibName: XIBNames.LOGIN_CONTROLLER.rawValue, bundle: nil)
        self.loginNavigationController = UINavigationController()
        self.loginNavigationController?.pushViewController(loginController, animated: true)
        
        //init club home controllre for tabbed view
        self.clubHomeController = UITabBarController()
        
        //init controllers for different tabs - club home tabs
        let eventViewController = EventViewController(nibName: XIBNames.EVENT_CONTROLLER.rawValue, bundle: nil)
        let fineViewController = FineViewController(nibName: XIBNames.FINE_CONTROLLER.rawValue, bundle: nil)
        let drinkViewController = DrinkViewController(nibName: XIBNames.DRINK_CONTROLLER.rawValue, bundle: nil)
        
        //Set names for tabs
        eventViewController.tabBarItem.title = NSLocalizedString("EVENTS", comment: "Event tab title")
        fineViewController.tabBarItem.title = NSLocalizedString("FINES", comment: "Fine tab title")
        drinkViewController.tabBarItem.title = NSLocalizedString("DRINKS", comment: "Drink tab title")

        //set controllers for club home controller
        let controllers = [eventViewController, fineViewController, drinkViewController]
        self.clubHomeController!.setViewControllers(controllers, animated: true)
        
        //prepare to start without main storyboard
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = window {
            self.window?.rootViewController = loginNavigationController
            self.window?.backgroundColor = UIColor.whiteColor()
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

