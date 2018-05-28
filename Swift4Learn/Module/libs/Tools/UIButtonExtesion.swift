//
//  UIButtonExtesion.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/10.
//  Copyright © 2018年 tony. All rights reserved.
//
import Foundation
import UIKit

extension UIButton{
    //
    static func initWith(frame: CGRect,
                         buttonType: UIButtonType,
                         btnTitle: String?,
                         titleState: UIControlState,
                         btnImage: String?,
                         imageState: UIControlState,
                         target: Any?,
                         action: Selector,
                         actionEvent:UIControlEvents) -> UIButton {
        let btn:UIButton = UIButton.init(type:.custom)
        btn.frame = frame
        if btnTitle != nil {
            btn.setTitle(btnTitle, for: titleState)
        }
        if btnImage != nil {
            btn.setImage(UIImage.init(named: btnImage!), for: imageState)
        }
        let act = action
        btn.addTarget(target, action: act, for: actionEvent)
        return btn
    }
}
