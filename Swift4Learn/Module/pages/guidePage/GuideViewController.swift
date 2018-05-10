//
//  GuideViewController.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/10.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class GuideViewController: BaseViewController {
   

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addViews() {
        let guidePicArr:Array<String> = ["s","s","s"]
        var scrollView:UIScrollView! = UIScrollView.initWith(frame:(CGRect.init(x: 0, y: 0, width: 0, height: 0)), delegate: self as! UIScrollViewDelegate, contentSize: CGSize.init(width: 0, height: 0))
        var num:NSInteger = 0;
        for string:String in guidePicArr {
            var imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 00, height: 0))
            imageView.image = UIImage.init(named: string)
            scrollView .addSubview(imageView)
            if num == guidePicArr.count - 1{
                var btn = UIButton.init(type: UIButtonType.custom)
            }else{
                
            }
            num += 1
        }
        self.view .addSubview(scrollView)
    }
}
