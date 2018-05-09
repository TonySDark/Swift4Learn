//
//  LoginViewController.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/8.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //嗯，相对于OC的xib的在m文件的声明，多了一些修饰，这也是必要的，毕竟h文件没了
    @IBOutlet weak var appIconImagView: UIImageView!
    @IBOutlet weak var accountTextF: UITextField!
    @IBOutlet weak var passwordTextF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
