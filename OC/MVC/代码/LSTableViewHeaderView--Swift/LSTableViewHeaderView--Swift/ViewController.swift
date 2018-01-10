//
//  ViewController.swift
//  LSTableViewHeaderView--Swift
//
//  Created by lisonglin on 27/06/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

import UIKit

let KScreenWidth: CGFloat = UIScreen.main.bounds.size.width
let KScreenHeight: CGFloat = UIScreen.main.bounds.size.height
let HeaderHeight: CGFloat = 200.0


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    var bgImage : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        
        self.initTableView()
    }
    
    func initTableView() -> Void {
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight), style: UITableViewStyle.plain)
        self.tableView?.backgroundColor = UIColor.clear
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: HeaderHeight))
        
        headerView.backgroundColor = UIColor.white
        
        let image = UIImageView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: KScreenWidth, height: HeaderHeight))
        
        image.image = UIImage.init(named: "b")
        
        headerView.addSubview(image)
        
        self.bgImage = image
        
        self.tableView?.tableHeaderView = headerView
        
        self.view .addSubview(self.tableView!)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text =  "这是第"+"\(indexPath.row)"+"个cell"
        
        return cell!

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY: CGFloat = CGFloat(scrollView.contentOffset.y)
        
        if offsetY < 0 {
            let totalOffsetY = HeaderHeight + abs(offsetY)
            
            let f = CGFloat(totalOffsetY / HeaderHeight)
            
            self.bgImage!.frame = CGRect.init(x: -(KScreenWidth * f - KScreenWidth) / 2, y: offsetY, width: KScreenWidth * f, height: totalOffsetY)
            
        }
        
    }

}

