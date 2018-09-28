//
//  ViewController.m
//  调度组
//
//  Created by Watson on 2017/3/23.
//  Copyright © 2017年 Watson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self group2];


}

/*
    $ man dispatch_group_enter
 
 */

-(void)group2{
    
    //1.创建调度组
    dispatch_group_t group = dispatch_group_create();
    
    //2.队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    //调度组 入组和出组要配对使用
    /*
     1）调度组没有任务，直接执行notify
     2）入组多于出组，notify永远不会执行，因为组永远为空
     3）出组多余入组，会崩溃，因为没有东西出组，不知道出谁
     
     */
    //1》入组
    dispatch_group_enter(group);
    dispatch_async(q, ^{
        
        NSLog(@"download A %@",[NSThread currentThread]);
        
        //2>出组
        dispatch_group_leave(group);
    
    });
    //1》入组
    dispatch_group_enter(group);
    dispatch_async(q, ^{
        
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"download B %@",[NSThread currentThread]);
        
        //2>出组
        dispatch_group_leave(group);
        
    });
    //4.监听
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        NSLog(@"come here %@",[NSThread currentThread]);
    });
}


/*
 调度组最重要的目的 -- 监听一组任务的完成
 */
-(void)group1{

    //1.创建调度组
    dispatch_group_t group = dispatch_group_create();
    
    //2.队列
    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
    
    //3.调度组监听调度任务
    dispatch_group_async(group, q, ^{
        
        NSLog(@"download A %@",[NSThread currentThread]);
    });
    dispatch_group_async(group, q, ^{
        NSLog(@"download B %@",[NSThread currentThread]);
    });
    //等上面2个方法执行完才执行下面方法
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        NSLog(@"come here %@",[NSThread currentThread]);
    });
    
}


@end
