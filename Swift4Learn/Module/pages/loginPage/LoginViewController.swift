//
//  LoginViewController.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/8.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    @objc let account = "account"
    @objc let password = "password"
    
    /*  5.9
     嗯，相对于OC的xib的在m文件的声明，多了一些修饰，这也是必要的，毕竟h文件没了
     */
    @IBOutlet weak var accountTextF: UITextField!
    @IBOutlet weak var passwordTextF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func psw_loginAction(_ sender: UIButton) {
        //判断账号密码才能进入
        if (accountTextF.text == "mm") {
            //账号通过
        }else{
            self.showWarning()
            return;
        }
        if (passwordTextF.text == "123456") {
            //密码通过
        }else{
            self.showWarning()
            return;
        }
        let guideVC =  GuideViewController.init()
        // 这个默认是 protected 还是 public呢？
        guideVC.goAheadAciton()
        self.view.window?.rootViewController = guideVC;
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        accountTextF.resignFirstResponder()
        passwordTextF.resignFirstResponder()
    }
    
    /// 简单的提示信息
    func showWarning() {
        accountTextF.text = "X安全措施100保护中X";
        passwordTextF.text = "你是谁呀？=.=";
    }
}
