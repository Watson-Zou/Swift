//
//  String+Extensions.swift
//  正则表达式
//
//  Created by Watson on 2017/6/2.
//  Copyright © 2017年 Watson. All rights reserved.
//

import Foundation

extension String {

    //从当前字符串中，提取链接和文本
    //swift提供了元组，同时返回多个值
    //如果是oc，可以返回字典/自定义对象/指针的指针
    func cz_href() -> (link:String,text:String) {
        //0,匹配方案 关心的内容用（.*?） 不关心的内容删掉用 .*? 代替
        let pattern = "<a href=\"(.*?)\".*?\">(.*?)</a>"
        //1.创建正则表达式 并且匹配第一项
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else {
            return ("","")
        }
        guard let result = regx.firstMatch(in: self, options: [], range: NSRange(location: 0, length: characters.count)) else {
            return ("","")
        }
        //2.获取结果
        let link = (self as NSString).substring(with: result.rangeAt(1));
        
        let text = (self as NSString).substring(with: result.rangeAt(2));
        
        return (link,text)
    }
    
    
    
    
}
