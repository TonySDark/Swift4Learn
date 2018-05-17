
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
            let icon = UIImageView.init(frame: CGRect.init(x: 20, y: 20, width: 120, height: 120))
            icon.image = UIImage.init(named: "哼.jpg")
            icon.backgroundColor = UIColor.red
            self.addSubview(icon)
            let label = UILabel.init(frame: CGRect.init(x: icon.frame.maxX+20, y: icon.frame.minX+20, width: 200, height: 60))
            label.text = "MM"
            label.textColor = UIColor.black
            self.addSubview(label)
        }
    }
    
    
}
