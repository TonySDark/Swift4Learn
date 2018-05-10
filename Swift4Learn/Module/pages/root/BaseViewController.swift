//
//  BaseViewController.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/10.
//  Copyright © 2018年 tony. All rights reserved.
//
protocol CSW_BaseViewControllerProtocol {
    
    //建立一个自定义的swift协议

    
    func o_csw_pushToController(controller:BaseViewController,toController:BaseViewController) -> Bool
    func o_csw_modalToController(controller:BaseViewController,toController:BaseViewController) -> Bool
    
}
import UIKit

//除了继承父类  还能继承协议的方法
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
    func o_csw_pushToController(controller: BaseViewController, toController: BaseViewController) -> Bool {
        return true
    }
    func o_csw_modalToController(controller:BaseViewController,toController:BaseViewController) -> Bool{
        return true
    }



}
