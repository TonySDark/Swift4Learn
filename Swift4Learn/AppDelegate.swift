//
//  AppDelegate.swift
//  Swift4Learn
//
//  Created by Tony on 2017/8/29.
//  Copyright © 2017年 tony. All rights reserved.
//

import UIKit
@UIApplicationMain
//main函数入口 嗯，main.m 没了,所以最多的头疼的崩溃点在这里
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //swift UserDefaults <==> Object-C NSUserDefaults
        //读取存储信息
        //这里存在一个技巧 这个时候 userDefaults里边是没有 ”isFirst“对应的值的
        
        
        /*
         +standardUserDefaults returns a global instance of NSUserDefaults configured to search the current application's search list.
         */
        let userDefaults:UserDefaults =  UserDefaults.standard
        
        //UserDefaults.resetStandardUserDefaults() 重置？ 有点意思
        //TODO 需要深入

        let isFirst:Bool = userDefaults.bool(forKey: "isNotFirst")
        if isFirst == false {
            let loginVC = LoginViewController.init()
            self.window?.rootViewController = loginVC
        }else{
         //设置同步
            let homeVC =  HomeViewController.init()
            self.window?.rootViewController = homeVC
        }
    
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


}

