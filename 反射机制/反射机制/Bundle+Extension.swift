//
//  Bundle+Extension.swift
//  反射机制
//
//  Created by Watson on 2017/3/8.
//  Copyright © 2017年 Watson. All rights reserved.
//

import Foundation

extension Bundle{

    //通过函数 返回命名空间字符串
    //func namespace() ->String {
        //return infoDictionary?["CFBundleName"] as? String ?? ""//return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
    //}
    
    //通过计算型属性 返回命名空间字符串
    var namespace:String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
