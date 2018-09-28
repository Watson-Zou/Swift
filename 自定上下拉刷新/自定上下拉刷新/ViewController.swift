//
//  ViewController.swift
//  自定上下拉刷新
//
//  Created by Watson on 2017/4/5.
//  Copyright © 2017年 Watson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //懒加载
    lazy var refreshControl:ZHSRefreshControl = ZHSRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置contentoffset
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        
        
        //添加控件
        tableView.addSubview(refreshControl)
        
    
        //监听方法
        refreshControl.addTarget(self, action: #selector(loadData), for:.valueChanged)
        
        loadData()
    }

    func loadData()  {
        
        //开始刷新
        print("开始刷新")
        refreshControl.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
        
            print("结束刷新")
            self.refreshControl.endRefreshing()
        }
        
    }


}

