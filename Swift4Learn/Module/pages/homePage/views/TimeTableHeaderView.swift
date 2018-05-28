
//
//  TimeTableHeaderView.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/15.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class TimeTableHeaderView: UIView {
    var showMusicSwitch:MusicShowView?
    var nameLab:UILabel? = nil
    var descLab:UILabel? = nil
    var musicPlayer:MusicPlayer! = MusicPlayer()
    
    //这里写自己的话
    
    let words1Arr = ["第一行字"]
    let words2Arr = ["第二行字"]
    let happyWordsArr1 = ["first line"]
    let happyWordsArr2 = ["second line"]
    
    
    deinit {
        musicPlayer.stop()
        musicPlayer = nil
        NotificationCenter.default.removeObserver(self)
    }
    static func initWith(frame: CGRect,backgroundColor: UIColor) -> TimeTableHeaderView {
        let view = TimeTableHeaderView.init(frame: frame)
        view.backgroundColor = backgroundColor
        view.parentViewAddAllChildViews(view)
        NotificationCenter.default.addObserver(view, selector:#selector(view.ohTheDayIsComing(_:)), name: Notification.Name(rawValue: "TheDayIsComing"), object: nil)

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
                                             target: self,
                                             action: #selector(self.playOrStopAction(_:)),
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
                                            .frame.maxY+20,
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
            showMusicSwitch?.musicPlayer = musicPlayer
            if (musicPlayer?.getInstance().isPlaying == true) {
                    showMusicSwitch?.startAnimation()
            }
            self.addSubview(showMusicSwitch!)
        }
    }
}
extension TimeTableHeaderView{
    //  动作
    @objc func playOrStopAction(_ btn: UIButton) {
        var imageName = ""
        if (showMusicSwitch?.showMusic() == true) {
            imageName = "pause.png"
        }else{
            imageName = "play.png"
        }
        btn.setImage(UIImage.init(named:imageName), for: .normal)

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
        if (message.compare("prince").rawValue == 0)  {
            let num = Int(arc4random_uniform(UInt32(happyWordsArr1.count-1)))

            nameLab!.text = happyWordsArr1[num]
            descLab!.text = happyWordsArr2[num]
        }
        if (message.compare("alwaysPrince").rawValue == 0)  {
            
           let num = Int(arc4random_uniform(UInt32(words1Arr.count-1)))
            nameLab!.text = words1Arr[num]
            descLab!.text = words2Arr[num]
        }
    }
    
}
