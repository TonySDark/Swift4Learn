//
//  DataResulter.swift
//  Swift4Learn
//
//  Created by Tony on 2018/6/4.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class DataResulter: NSObject {
    //MVC/MVP   M层   数据提供    数据层
    
    func getData() {
       //网络获取数据
        //这里写自己的话
        let words1Arr = ["认真的看着我的眼神～你已经说过早啦",
                         "有些时候，心有郁结而不能发。",
                         "就会写东西抒发情感",
                         "原谅无知的羔羊吧 公主",
                         "喝水会笑的狗，哇！！",
                         "只希望你每天都快快乐乐的"]
        let words2Arr = ["？对啊,😂",
                         "乖巧的我，认真听你讲话",
                         "哦~",
                         "哼(´◔ ‸◔')我这么傲娇，不和你打电话",
                         "是不是很有喜感,像你一样",
                         "我要静静地抱住我圆滚滚的身体"]
        let happyWordsArr1 = ["美美，Happy BirthDay!",
                              "为每天的你献上祝福！"]
        let happyWordsArr2 = ["为美丽的公主献上祝福！",
                              "为平凡的你献上祝福！"]

    }
    
    func offerDataToVC() {
       // 提供VC data数据
    }
    
    func dataChangeToRefreshUI() {
        //让VC刷新
    }
    
    
}
