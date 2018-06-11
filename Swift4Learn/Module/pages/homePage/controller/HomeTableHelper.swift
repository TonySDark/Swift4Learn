//
//  HomeTableHelper.swift
//  Swift4Learn
//
//  Created by Tony on 2018/6/5.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit
// 拉出一个基础的tableView辅助   MVC 实质的Controller 层
class HomeTableHelper: NSObject,UITableViewDataSource,UITableViewDelegate {
    weak var weakTableView:UITableView?
    var musicPlayer: MusicPlayer = MusicPlayer.getMusicPlayer()
    var dataOffer: DataResulter?
    var dataSource: NSMutableArray! = NSMutableArray.init(capacity: 0)
    static func getHelper(tableView:UITableView) -> HomeTableHelper{
        return HomeTableHelper.initHelper(tableView: tableView)
    }
    static func initHelper(tableView: UITableView) -> HomeTableHelper {
        let helper = HomeTableHelper()
        helper.weakTableView = tableView
        tableView.dataSource = helper;
        tableView.delegate = helper;
        return helper
    }
    
    
    
    
    //UITableViewDataSource/UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
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
        print(#function)
        //        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    
    func playMusic() -> Bool{
        if (musicPlayer.getInstance().isPlaying == false) {
            musicPlayer.getInstance().play()
            return true
        }else{
            musicPlayer.getInstance().pause()
            return false
        }
    }
}
