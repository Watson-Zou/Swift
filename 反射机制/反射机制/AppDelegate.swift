//
//  AppDelegate.swift
//  反射机制
//
//  Created by Watson on 2017/3/8.
//  Copyright © 2017年 Watson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    //注意window是可选的
    var window: UIWindow?
    
    /*
     1.知道swift中有命名空间
        --在统一哥命名空间下，全局共享
        --在第三方框架使用swift，如果直接拖拽到项目中，从属于同一个命名空间，很有可能有冲突
        --以后尽量利用cocoapod
     2.重点知道swift中国年NSClassFromString（反射机制）的写法
        --反射机制最重要的目的，就是为了解耦
        --搜索‘反射机制’和工厂方法
     
     */
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //1.实例化window
        //?都是可选解包，发送消息，不参与运算
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        //1>.因为字典是可选的，因此需要解包再取值，如果字典为nil，就不取值
        //2>.通过key从字典中取值，如果key错了，就没有值了
        //3>.as? 强转为字符串类型  ?? 设置默认值
        //let ns = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        
        //通过扩展函数获取命名空间
        //let ns = Bundle.main.namespace()
        
        //通过计算型属获取命名空间  从阅读上更直观
        let ns = Bundle.main.namespace
        
        //2.设置根控制器，需要添加命名空间，默认是项目名称（所以项目名称最好不要有数字和特殊符号）
        let clsName = ns + "." + "ViewController"
        //func NSClassFromString(_ aClassName: String) -> AnyClass?   AnyClass?视图控制器的类型
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        //使用类创建视图控制器
        let vc = cls?.init()
        window?.rootViewController = vc
        
        //3.让window可见
        window?.makeKeyAndVisible()
        
        
        
        
        
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

