//
//  ViewController.swift
//  Test2017.09.22
//
//  Created by mic on 2017/9/22.
//  Copyright © 2017年 yunfu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...3 {
            print("index is\(index)");
        }
        //数组
        let array = ["111", "2222", "3333"];
        for arr in array {
            print("arr is :\(arr)");
        }
        
        //字典
        let diction = ["Xcode":11, "iOS":11, "Jhon":58];
        for (_,arr) in diction {
            print("xcode is \(arr)");
        }
        
        //while循环
        var index = 0;
        while index < 3 {
            index += 1;
            print("115541231234564561355");
        }
        
        let myColor = UIColor.red;
        self.view.backgroundColor = myColor;
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

