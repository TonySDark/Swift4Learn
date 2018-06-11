//
//  BaseViewController.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/10.
//  Copyright © 2018年 tony. All rights reserved.
//
protocol CSW_BaseViewControllerProtocol {
    
    //一个自定义的swift协议
    
    //声明这是一个协议定义的并且是自定义的swift方法
    func p_csw_pushToController(controller:BaseViewController,toController:BaseViewController) -> Bool
    func p_csw_modalToController(controller:BaseViewController,toController:BaseViewController) -> Bool
    
}
import UIKit

//除了继承父类  还能继承协议的方法

// MVC架构中注意：它不是C， 他只是 视图控制器

// MVP架构持有 BaseController

class BaseViewController: UIViewController,CSW_BaseViewControllerProtocol {

    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func p_csw_pushToController(controller: BaseViewController, toController: BaseViewController) -> Bool {
        return true
    }
    @objc func p_csw_modalToController(controller:BaseViewController,toController:BaseViewController) -> Bool{
        return true
    }



}
