//
//  BasePresenter.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/10.
//  Copyright © 2018年 tony. All rights reserved.
//
protocol CSW_PresenterProtocol {
    //MVP架构  presenter层   业务层   更新M层  ，通知V层更新， 初始化下级presenter
    
} 
import UIKit

class BasePresenter: NSObject {
    //持有子presenter（比如cellPresenter）   发命令给相应的view
    
    
    //TODO 处理网络请求的方法
    func o_csw_presenterHandleData(data:NSObject?,hasCache:Bool?) -> Bool {
        return false;
    }
}
