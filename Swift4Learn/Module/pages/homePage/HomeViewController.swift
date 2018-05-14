//
//  HomeViewController
//  Swift4Learn
//
//  Created by Tony on 2017/8/29.
//  Copyright © 2017年 tony. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    @objc var _tableView : UITableView!
    @objc var _dataSource : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addNavigationBar()
        self.viewConfig()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 视图
    func addNavigationBar(){
        self.navigationController?
        .navigationBar.backgroundColor = UIColor.black
        
    }
    func viewConfig() -> Void {
        // 代码规范写的很痛苦  看的比较舒畅
        _tableView = UITableView.init(frame:
                     CGRect.init(x: 0,
                                 y: 0,
                                 width: kScreenWidth,
                                 height: kScreenHeight),
                                 style: UITableViewStyle.plain)
        _tableView.delegate = self as! UITableViewDelegate;
        _tableView.dataSource = self as! UITableViewDataSource;
        _tableView.rowHeight = 90.0;
        self.view.addSubview(_tableView)
    }

    
    //UITableViewDataSource/UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseStr = "cellReuse"
        var cell = tableView
            .dequeueReusableCell(withIdentifier:        reuseStr)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: reuseStr)
        }
        
        return cell!;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

