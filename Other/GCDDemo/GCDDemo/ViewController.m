//
//  ViewController.m
//  GCDDemo
//
//  Created by mic on 2017/11/27.
//  Copyright © 2017年 JZ. All rights reserved.
//
/**
 *GCD多线程的简单测试
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//定义一个回调函数
void function(void* str)
{
    printf("回调函数  %s\n",str);
    NSLog(@"当前线程--%@",[NSThread currentThread]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //串行队列 一次只执行一个任务
    //[self serialQueue];
    //并行队列
    //[self concurrentQueue];
    //系统提供的队列 全局队列 是并行队列
    //[self globalQueue];
    //全局队列和主队列结合使用
    //[self globalAndMainQueue];
    //GCD的其他方法
    //[self otherGCDMethod];
    //GCD---Group
    //[self groupGCD];
    //GCD---添加阻碍
    [self barrierGCD];
}
/**
 *  串行队列 一次只执行一个任务
 */
- (void)serialQueue{
    //创建队列
    dispatch_queue_t serialQueue = dispatch_queue_create("串行队列", DISPATCH_QUEUE_SERIAL);
    //为队列中添加任务
    //同步执行dispatch_sync 同步任务与当前的线程是一个线程 同步会阻塞当前线程
    //异步执行diapatch_sync
    for (int i = 0; i < 10; i++) {
        dispatch_async(serialQueue, ^{
            NSLog(@"我是串行队列， 我是第%d步   当前线程----%@", i,[NSThread currentThread]);
        });
    }
    
    NSLog(@"最后执行的线程  %@", [NSThread currentThread]);
}
/**
 *  并行队列
 */
- (void)concurrentQueue{
    //创建并行队列
    dispatch_queue_t concurrent = dispatch_queue_create("并行队列", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 10; i++) {
        dispatch_sync(concurrent, ^{
            NSLog(@"我是并行队列,第%d步,当前线程--%@", i, [NSThread currentThread]);
        });
    }
    NSLog(@"最后执行的线程  %@", [NSThread currentThread]);
}
/**
 *  系统提供的队列 全局队列 是并行队列
 */
- (void)globalQueue{
    //系统提供的全局队列
    //第一个参数：优先级  DISPATCH_QUEUE_PRIORITY_DEFAULT 0,  LOW -2, HIGH 2, BACKGROUND INT16_MIN
    //第二个参数：Flags that are reserved for future use. Always specify 0 for this parameter.
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //添加任务
    dispatch_async(globalQueue, ^{
        for (int i = 0; i < 7; i++) {
            NSLog(@"全局队列%d  --------  当前线程%@", i, [NSThread currentThread]);
        }
    });
}
/**
 *  全局队列和主队列结合使用
 */
- (void)globalAndMainQueue{
    
    //首先创建全局队列
    dispatch_queue_t globalQueue = dispatch_queue_create(0, 0);
    
    dispatch_async(globalQueue, ^{
        
        //处理子线程耗时 操作
        NSLog(@"处理子线程耗时 操作");
        dispatch_async(dispatch_get_main_queue(), ^{
            //回到主线程
            UIView *viwe =[[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            viwe.backgroundColor = [UIColor yellowColor];
            
            [self.view addSubview:viwe];
        });
    });
    
}
/**
 *  GCD的其他方法
 */
- (void)otherGCDMethod{
    //GCD  让函数只运行一次
    for (int i = 0; i < 10; i++) {

        static dispatch_once_t onceToken;

        dispatch_once(&onceToken, ^{
            NSLog(@"这个方法处理了%d次", i);
        });

    }
    
    /**
     *  GCD的延迟计算方法
     *  从延迟时间点开始计算
     *  1.从什么时间开始计算
     *  2.从此时间多少秒执行
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"after 5 秒延时执行 ---- %@", [NSThread currentThread]);
    });
    
    sleep(5);
    
    /**
     *  GCD的重复执行方法
     *  1.重复执行的次数
     *  2.队列
     */
    dispatch_apply(3, dispatch_get_global_queue(0, 0), ^(size_t count) {
        NSLog(@"执行的次数 %ld", count);
    });
}
/**
 *  GCD将任务添加到队列中
 */
- (void)groupGCD{
    //dispatch_group_async 可以实现监听一组任务是否完成  完成后得到通知执行其他的操作 这个方法很有用 比如你执行三个下载任务 当三个任务都下载完成之后你才通知界面已经完成 例：
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    for (int i = 0; i < 5; i++) {
        dispatch_group_async(group, queue, ^{
            
            sleep(2);
            
            [NSThread sleepForTimeInterval:i];
            
            NSLog(@"group  %d", i);
            
        });
    }
    
    
    //当for循环中的所有任务都执行完成之后 就执行notify
    //在执行notify之前至少给队列里添加一个任务
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"刷新UI页面");
    });
}
/**
 *   GCD 添加阻碍
 *   数据库的读取  可以并发执行，通过GCD里面的并行队列实现
 *   数据库的写入  只能串行执行，通过GCD里面的串行队列实现
 *   但项目中，有读取和写入，通过dispatch_barrier_async实现，此任务执行的时候，其他任务停止执行
 */
- (void)barrierGCD{
    
    //创建并发队列
    dispatch_queue_t  queue = dispatch_queue_create("并发队列", DISPATCH_QUEUE_CONCURRENT);
    
    //添加任务
    dispatch_async(queue, ^{
        NSLog(@"这个任务所在的线程是  %@", [NSThread currentThread]);
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"阻塞线程");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"这个任务所在的线程是**********************  %@", [NSThread currentThread]);
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
