//
//  ViewController.swift
//  Swift4Learn
//
//  Created by Tony on 2017/8/29.
//  Copyright © 2017年 tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _tableView : UITableView!
    var _dataSource : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //
    func viewConfig() -> Void {
        _tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0),
                                      style: UITableViewStyle.plain)
        _tableView.delegate = self as? UITableViewDelegate;
        _tableView.dataSource = self as? UITableViewDataSource;
        _tableView.rowHeight = 90.0;
        self.view.addSubview(_tableView)
    }
    
    
    
    
    
    
    
}

