//
//  PopularViewExtension.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/15.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

protocol CSW_CustomViewProtocol {
    
    
    
    
    /// 清除所有子视图
    func parentViewclearAllChildViews(_ parentView: UIView?)
    /// 添加所有子视图
    func parentViewAddAllChildViews(_ parentView: UIView?)
    
    
}


extension UIView:CSW_CustomViewProtocol{
    
//    public func initWith(_ frame: CGRect,backgroundColor: UIColor){
//        let view = UIView.init(frame: frame)
//        view.backgroundColor = backgroundColor
//    }
 
    
   open func parentViewclearAllChildViews(_ parentView: UIView?) {
        if parentView == nil {
            for childView:UIView in self.subviews {
                childView.removeFromSuperview()
            }
        }else{
            for childView:UIView in (parentView?.subviews)! {
                childView.removeFromSuperview()
            }
        }
    }

    open func parentViewAddAllChildViews(_ parentView: UIView?){
        // 需要子类实现
    }
    
    

    
    
}
