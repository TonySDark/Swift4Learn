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

class HomeViewController: BaseViewController{
    var tableView : UITableView!
    var homeTabHelper:HomeTableHelper?
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
 
    // 视图
    func addNavigationBar(){
        self.navigationController?
        .navigationBar.backgroundColor = UIColor.black
        self.title = "时光"
        //这里很奇怪 必须写成OC的方式，否则找不到方法
        //猜测应该是反射到该方法的
        let leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem:.add,
                                                      target:self,
                                                      action:
            #selector(HomeViewController.addPicture)
        )
        self.navigationItem.leftBarButtonItem = leftBarButtonItem

        
        let rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem:.bookmarks,
                                 target:self,
                                 action:
            #selector(HomeViewController.goSuriprisePage)
            )
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    //完整的无返回值的方法
    func viewConfig() -> Void {
        autoreleasepool {
            // 代码规范写的很痛苦  看的比较舒畅
            self.tableView = UITableView.init(
                                frame:CGRect.init(x: 0,
                                                  y: 0,
                                                  width: kScreenWidth,
                                                  height: kScreenHeight
                                                  ),
                                style: UITableViewStyle.plain
                                          )
            self.tableView.rowHeight = 90.0;
            self.view.addSubview(self.tableView)
            
            self.tabHeaderView = TimeTableHeaderView
                            .initWith(frame: (CGRect
                                              .init(x: 0,
                                                    y: 0,
                                                    width:
                                                kScreenWidth,
                                                    height:
                                                kScreenWidth/2)),
                                      backgroundColor: (UIColor.white),
                                      target:self,
                                      action:#selector(showMusic))
            self.tableView.tableHeaderView = self.tabHeaderView
            //初始化controller
            homeTabHelper = HomeTableHelper.getHelper(tableView: self.tableView)

        }
    }
}
extension HomeViewController{
    //ButtonAction
    @objc func goSuriprisePage(){
        print(#function + "去网页")
        let endVC = EndViewController.init()
        self.navigationController?
            .pushViewController(endVC, animated: true)
    }
    @objc func addPicture(){
        /***TODO 添加图片***/
        print(#function + "添加图片")
        let itemVC = ItemViewController.init()
        self.navigationController?
            .pushViewController(itemVC, animated: true)
    }
    @objc func showMusic() -> Bool{
        print(#function)
        let isExcuted:Bool = (homeTabHelper?.playMusic())!
        if (isExcuted){
            tabHeaderView?.showMusicSwitch?.startAnimation()
        }else{
            tabHeaderView?.showMusicSwitch?.stopAnimation()
        }
        return isExcuted
    }
}
