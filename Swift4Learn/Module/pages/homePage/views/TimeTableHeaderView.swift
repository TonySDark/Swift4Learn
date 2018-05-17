
//
//  TimeTableHeaderView.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/15.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class TimeTableHeaderView: UIView {

    static func initWith(frame: CGRect,backgroundColor: UIColor) -> TimeTableHeaderView {
        let view = TimeTableHeaderView.init(frame: frame)
        view.backgroundColor = backgroundColor
        view.parentViewAddAllChildViews(view)
        return view
     }
    //swift重写方法
    override func parentViewAddAllChildViews(_ parentView: UIView?) {
        autoreleasepool {
            let iconImgVw = UIImageView
                            .init(frame:CGRect.init(x: 20,
                                                    y: 20,
                                                    width: 120,
                                                    height: 120))
            iconImgVw.image = UIImage
                              .init(named: "哼.jpg")
            iconImgVw.backgroundColor = UIColor
                                        .red
            self.addSubview(iconImgVw)
            let nameLab = UILabel
                          .init(frame: CGRect.init(x:iconImgVw
                                                     .frame.maxX+20,
                                                   y:iconImgVw
                                                    .frame.minX+20,
                                                   width: 200,
                                                   height: 60))
            nameLab.text = "MM"
            nameLab.textColor = UIColor.black
            self.addSubview(nameLab)
            //
            //这里添加一个音乐播放器
            let musicImgVw = UIImageView
                             .init(frame: CGRect.init(x: self
                                                    .frame.maxX-30,
                                                      y: self
                                                        .frame.maxY-30,
                                                      width: 40,
                                                      height: 40))
            musicImgVw.image = UIImage
                              .init(named: "哼.jpg")
            musicImgVw.backgroundColor = UIColor.red
            self.addSubview(musicImgVw)
        }
    }
    
    
}
