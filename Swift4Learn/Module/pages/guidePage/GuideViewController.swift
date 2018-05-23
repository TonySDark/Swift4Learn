//
//  GuideViewController.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/10.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class GuideViewController: BaseViewController,UIScrollViewDelegate {
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.addViews()
        self.musicStart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func musicStart() {
        if (MusicPlayer.getInstance().isPlaying == false) {
            do {
                MusicPlayer.getInstance().play()
            } catch {
                
            }
        }
    }
    
    
    
    @objc func addViews() {
        //笔者这里图片就不给大家了，
        let guidePicArr:Array<String> = [
            "16A55A11CFF1A472A2B56B721618D445.jpg",
            "194FC7F20160842B92F847D27BC9695D.jpg",
            "1201CE9EBF1BF41FCE6273380881046A.jpg"]
        //你一定会问我系列套餐：constant.swift
        //? 和 ! 其实分别是Swift语言中对一种可选类型（ Optional) 操作的语法。一个没赋值 一个 赋值了
        //After that， 后你一定还会问我 x:类型？ 这是啥
        //After that，你一定更会问我 self as UIScrollViewDelegate 这是啥  ---》  直观就是说 谁要作为代理人
        let scrollView:UIScrollView! = UIScrollView.initWith(
            frame:(CGRect.init(x: 0,
                               y: 0,
                               width: kScreenWidth,
                               height: kScreenHeight)),
            delegate: self as UIScrollViewDelegate,
            contentSize: CGSize.init(width: kScreenWidth*CGFloat(guidePicArr.count), height: kScreenHeight))
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        var num:NSInteger = 0
        for string:String in guidePicArr {
            //你可能会卡在 binary operator '*'cannot be applied to operands of type 'CGFloat' and 'NSInterger'
            //两个不同类型的数据不能*计算 swift真真好可怕
            //注意区别 OC （(CGFloat）num)  
            //我们需要强转换一下类型
            let imageView = UIImageView.init(
                                    frame: CGRect.init(
                                        x:kScreenWidth*CGFloat(num),
                                        y: 0,
                                        width: kScreenWidth,
                                        height: kScreenHeight))
            imageView.isUserInteractionEnabled = true
            imageView.image = UIImage.init(
                                    named: string)
            scrollView .addSubview(imageView)
            if num == (guidePicArr.count - 1){
                let btn = UIButton.init(type: UIButtonType.custom)
                btn.frame = CGRect.init(x: kScreenWidth/2-45, y: kScreenHeight-230, width: 180, height: 80)
                btn.backgroundColor = UIColor.clear
                btn.setTitle("我们开始吧～", for: UIControlState.normal)
                btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
                btn.setTitleColor(UIColor.brown, for:UIControlState.normal)
                // 注意状态值：swift 是结构体的使用
//                    Selector  swift 是结构体的使用
                //"cyanButtonClick" ？？有警告，没有对应的Object-C方法，请加（）消除警告
                btn.addTarget(self,
                              action: Selector("goAheadAciton1:"),
                              for: UIControlEvents.touchDown)
                // 哈？怎么写也行！ 嗯，这里是swift版本迭代导致的多种写法Selector
                //写法2
//                btn.addTarget(self, action: Selector.init(("goAheadAciton")), for:.touchDown)
                //写法3
//                btn.addTarget(self,
//                              action: #selector(goAheadAciton1(_:)),
//                              for:.touchDown)
                //写法4
//                btn.addTarget(self,
//                              action: #selector(self.goAheadAciton1(_:)),
//                              for:.touchDown)
                
                imageView.addSubview(btn)
            }else{
                
            }
            num += 1
        }
        self.view.addSubview(scrollView)
    }
    //goAheadAciton() -> Void 中【-> Void】是可以省略的
    func goAheadAciton(){
        print(#function)
        
    }
    //#selector 是oc用法，需要声明 这个方法是objc的
    
    
    @objc func goAheadAciton1(_:UIButton){
        print(#function)//打印当前的方法
        let homeVC = HomeViewController.init()
        let navigationVC = UINavigationController.init(rootViewController: homeVC)
        self.view.window?.rootViewController = navigationVC;

    }
    /// UIScrollViewDelegate
    ///
    /// - Parameter _:
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    
}

