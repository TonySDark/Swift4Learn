//
//  HomeViewController
//  Swift4Learn
//
//  Created by Tony on 2017/8/29.
//  Copyright © 2017年 tony. All rights reserved.
//
//  人生是一场轮回，慢慢享受自己的那一份酸甜苦辣吧～～～
//  Long Live The Sunshine！Hello,The Dark!

import UIKit

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource{
    
    @objc var _tableView : UITableView!
    @objc var _dataSource : NSMutableArray!
    var tabHeaderView:TimeTableHeaderView?
    
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
    //ButtonAction
    @objc func AddPicture(){
        //添加图片
        print(#function)
    }
    // 视图
    func addNavigationBar(){
        self.navigationController?
        .navigationBar.backgroundColor = UIColor.black
        self.title = "时光"
        //这里很奇怪 必须写成OC的方式，否则找不到方法
        let rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem:.add,
                                 target:self,
                                 action:
            #selector(HomeViewController.AddPicture)
            )
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    func viewConfig() -> Void {
        autoreleasepool {
            
            _dataSource = NSMutableArray.init(capacity: 0)
            // 代码规范写的很痛苦  看的比较舒畅
            _tableView = UITableView.init(
                            frame:CGRect.init(x: 0,
                                              y: 0,
                                              width: kScreenWidth,
                                              height: kScreenHeight
                                              ),
                            style: UITableViewStyle.plain
                                          )
            _tableView.delegate = self as UITableViewDelegate;
            _tableView.dataSource = self as UITableViewDataSource;
            _tableView.rowHeight = 90.0;
            self.view.addSubview(_tableView)
            
            tabHeaderView = TimeTableHeaderView
                            .initWith(frame: (CGRect
                                              .init(x: 0,
                                                    y: 0,
                                                    width:
                                                kScreenWidth,
                                                    height:
                                                kScreenWidth/2)),
                                      backgroundColor: (UIColor.white))
            _tableView.tableHeaderView = tabHeaderView
        }
    }

    
    //UITableViewDataSource/UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataSource.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseStr = "cellReuse"
        var cell = tableView
            .dequeueReusableCell(withIdentifier: reuseStr)
        if cell == nil {
            cell = OldTimeTableViewCell.init(style:.default, reuseIdentifier: reuseStr)
        }
//        
        return cell!;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}

