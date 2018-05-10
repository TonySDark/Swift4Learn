//
//  BasePresenter.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/10.
//  Copyright © 2018年 tony. All rights reserved.
//
protocol CSW_PresenterProtocol {
    // presenter层
    
    // 添加视图操作
    func o_csw_addViews()
    //删除操作
    func o_csw_removeViews(views:[UIView]?) -> Bool
}
import UIKit

class BasePresenter: NSObject {
    //TODO 处理网络请求的方法
    func o_csw_presenterHandleData(data:NSObject?,hasCache:Bool?) -> Bool {
        return false;
    }
}
