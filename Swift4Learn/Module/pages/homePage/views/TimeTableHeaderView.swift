
//
//  TimeTableHeaderView.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/15.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class TimeTableHeaderView: UIView {
    public var showMusicSwitch:MusicShowView?
    private var nameLab:UILabel? = nil
    private var descLab:UILabel? = nil
    private var action:Selector? = nil
    private var target:UIViewController? = nil
    private var words1Arr:Array<String>? = nil
    private var words2Arr:Array<String>? = nil
    private var happyWordsArr1:Array<String>? = nil
    private var happyWordsArr2:Array<String>? = nil
    
    
    deinit {
    }
    static func initWith(frame: CGRect,
                         backgroundColor: UIColor,
                         target:UIViewController,
                         action:Selector
        ) -> TimeTableHeaderView {
        let view = TimeTableHeaderView.init(frame: frame)
        view.target = target
        view.action = action
        view.backgroundColor = backgroundColor
        view.parentViewAddAllChildViews(view)
        
//        NotificationCenter.default.addObserver(view, selector:#selector(view.ohTheDayIsComing(_:)), name: Notification.Name(rawValue: "TheDayIsComing"), object: nil)

        return view
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //swift重写方法
    override func parentViewAddAllChildViews(_ parentView: UIView?) {
        autoreleasepool {
            let iconImgVw = UIImageView
                            .init(frame:CGRect.init(x: 20,
                                                    y: 30,
                                                    width: 80,
                                                    height: 80))
            iconImgVw.image = UIImage
                              .init(named: "哼.jpg")
            iconImgVw.backgroundColor = UIColor
                                        .red
            self.addSubview(iconImgVw)
            // 这里使用OC的方式  可能会有♻️
            let playOrStopBtn = UIButton.initWith(frame: CGRect.init(x: iconImgVw.frame.maxX+30, y: iconImgVw.frame.minY, width: 40, height: 40),
                                             buttonType: .custom,
                                             btnTitle: nil,
                                             titleState:.normal, btnImage: "play.png",
                                             imageState:.normal,
                                             target: target!,
                                             action: action!,
                                             actionEvent: .touchDown)
            self.addSubview(playOrStopBtn)
            
            nameLab = UILabel
                          .init(frame: CGRect.init(x:iconImgVw
                                                     .frame.maxX+30,
                                                   y:playOrStopBtn
                                                    .frame.minY+40,
                                                   width: 254,
                                                   height: 50))
            nameLab?.numberOfLines = 2
            nameLab!.text = "😜"
            nameLab!.textColor = UIColor.black
            self.addSubview(nameLab!)
            
            descLab = UILabel
                .init(frame: CGRect.init(x:nameLab!
                    .frame.minX,
                                         y:nameLab!
                                            .frame.maxY+5,
                                         width: 254,
                                         height: 50))
            descLab!.text = "为美丽的世界献上祝福！"
            descLab?.numberOfLines = 2
            descLab!.textColor = UIColor.black
            self.addSubview(descLab!)
            
            //这里添加一个音乐播放器
            showMusicSwitch = MusicShowView
                             .init(frame: CGRect.init(x: self
                                                    .frame.maxX-60,
                                                      y: self
                                                        .frame.minY+20,
                                                      width: 40,
                                                      height: 40))
            self.addSubview(showMusicSwitch!)
        }
    }
}
extension TimeTableHeaderView{
    func setFirstLineData(list:Array<String>?) {
        words1Arr = list
    }
    func setSecondLineData(list:Array<String>?) {
        words2Arr = list
    }
    func setHappyDayFirstLineData(list:Array<String>?) {
        happyWordsArr1 = list
    }
    func setHappyDaySecondLineData(list:Array<String>?) {
        happyWordsArr2 = list
    }
    func setAllData(normalList1:Array<String>?,
                    normalList2:Array<String>?,
                    happyList1:Array<String>?,
                    happyList2:Array<String>?) {
        setFirstLineData(list: normalList1)
        setSecondLineData(list: normalList2)
        setHappyDayFirstLineData(list: happyList1)
        setHappyDaySecondLineData(list: happyList2)
    }
}

extension TimeTableHeaderView{
    
    //通知的方法
    /*
     *  TODO 通知
     */
    @objc func ohTheDayIsComing(_ userNotification:Notification) {
        var dic:Dictionary = userNotification.userInfo!
        let message:String = dic["time"] as! String
        /*
         *  TODO 字符串比较知识点
         *  https://www.aliyun.com/jiaocheng/363099.html
         */
        
        //这里需要容错
        if (happyWordsArr1 == nil || happyWordsArr2 == nil ||
            words1Arr == nil || words2Arr == nil
            || happyWordsArr1?.count == 0 || happyWordsArr2?.count == 0 || words1Arr?.count == 0 || words2Arr?.count == 0) {
            return
        }
        
        if (message.compare("prince").rawValue == 0)  {
            let num = Int(arc4random_uniform(UInt32((happyWordsArr1?.count)!-1)))

            nameLab!.text = happyWordsArr1?[num]
            descLab!.text = happyWordsArr2?[num]
        }
        if (message.compare("alwaysPrince").rawValue == 0)  {
            
            let num = Int(arc4random_uniform(UInt32((words1Arr?.count)!-1)))
            nameLab!.text = words1Arr?[num]
            descLab!.text = words2Arr?[num]
        }
    }
    
}
