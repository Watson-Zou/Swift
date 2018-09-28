//
//  ViewController.swift
//  正则表达式
//
//  Created by Watson on 2017/4/13.
//  Copyright © 2017年 Watson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //1.<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>
        //目标：取出href中的链接，以及文本描述
        let string = "<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>"
        
        // let pattern = "<a href=\"(.*?)\" rel=\"lsld\">(.*?)</a>"
        //2.创建正则表达式
        //0>pattern - 常说的正则表达式，就是pattern的写法【匹配方案】
        //索引：
        //0:和匹配方案完全一致的字符串
        //1:第一个（）中的内容
        //2:第二个（）中的内容
        //...索引从左到右顺序递增
        //
        //对于模糊匹配，如果关心的内容，就使用 (.*?) 然后通过索引可以获取结果
        //如果不关心的内容，就是 .*? 没有括号，可以匹配任意的内容
        //如果 (.*?)后面有 “ 要在 (.*?)后面加 \ 转义 -> (.*?)\"
        
        let pattern = "<a href=\"http://app.weibo.com/t/feed/6vtZb0\" rel=\"nofollow\">微博 weibo.com</a>"
        
        //1>创建正则表达式，如果pattern失败，抛出异常 弱try，不处理
        guard let regx = try? NSRegularExpression(pattern: pattern, options: []) else {
            return
        }
        
        //2>进行查找，两种查找方法
        //【只找一个匹配项／查找多个匹配项】
        guard let result = regx.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.characters.count)) else {
            
            print("没有找到匹配项")
            return
        }
        
        //3>result中只有2个重要的方法
        //result.numberOfRanges -> 查找到的范围数量
        //result.rangeAt(<#T##idx: Int##Int#>) -> 指定‘索引’位置的范围
        print("找到的数量\(result.numberOfRanges)")
        for idx in 0..<result.numberOfRanges {
            
            let r = result.rangeAt(idx)
            let subStr = (string as NSString).substring(with: r)
            print(subStr)
            
            
        }
    }

}




















