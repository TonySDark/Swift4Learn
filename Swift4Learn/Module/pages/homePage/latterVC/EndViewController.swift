//
//  EndViewController.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/28.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit
// 背景故事 --- 彩蛋
class EndViewController: BaseViewController {
    var webView:UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addWebView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addWebView() {
        webView = UIWebView.init(frame: self.view.bounds)
        webView?.loadRequest(URLRequest.init(url:
            URL.init(string: "https://www.baidu.com")!))
        webView?.delegate = self
        self.view.addSubview(webView!)
    }


}
extension EndViewController:UIWebViewDelegate{
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(#function)

    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        print(#function)

    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print(#function)
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(#function)
        return true
    }
    
    
}
