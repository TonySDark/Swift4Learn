
//
//  TimeTableHeaderView.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/15.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class TimeTableHeaderView: UIView {
    func initWith(frame: CGRect,backgroundColor: UIColor) -> TimeTableHeaderView {
        let view = UIView.init(frame: frame)
        view.backgroundColor = backgroundColor
        return view as! TimeTableHeaderView
    }

}
