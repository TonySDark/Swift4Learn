//
//  UIButtonExtesion.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/10.
//  Copyright © 2018年 tony. All rights reserved.
//
import Foundation
import UIKit

enum CSWE_ButtonTypeEnum {
    case textOnly
    case imageOnly
    case textAndImage
    
}
class CSW_ButtonType: NSObject {
    @objc func initWith(config:Dictionary<String, String>) -> CSW_ButtonType {
        //根据type匹配
        let btnType:CSW_ButtonType = CSW_ButtonType.init()

        
//        if textOnly {
//
//        }else if imageOnly{
//
//        }else{//textAndImage
//
//        }
        
        return btnType
    }
}



extension UIButton{
    
    func initWith(frame:CGRect,buttonType:CSWE_ButtonTypeEnum,btnTitle:String,btnImage:String) -> UIButton {
        var btn:UIButton = UIButton.init(frame: frame)
    
        return btn
    }
    
}
