
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
    
    static func initWith(frame: CGRect,backgroundColor: UIColor) -> TimeTableHeaderView {
        let view = TimeTableHeaderView.init(frame: frame)
        view.backgroundColor = backgroundColor
        view.parentViewAddAllChildViews(view)
        return view
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        NotificationCenter.default.addObserver(self, selector: Selector("ohTheDayIsComing:"), name: Notification.Name(rawValue: "TheDayIsComing"), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //swift重写方法
    override func parentViewAddAllChildViews(_ parentView: UIView?) {
        autoreleasepool {
            let iconImgVw = UIImageView
                            .init(frame:CGRect.init(x: 30,
                                                    y: 30,
                                                    width: 120,
                                                    height: 120))
            iconImgVw.image = UIImage
                              .init(named: "哼.jpg")
            iconImgVw.backgroundColor = UIColor
                                        .red
            self.addSubview(iconImgVw)
            
            let playOrStopBtn = UIButton.initWith(frame: CGRect.init(x: iconImgVw.frame.maxX+30, y: iconImgVw.frame.minY, width: 40, height: 40),
                                                  buttonType: .custom,
                                             btnTitle: nil,
                                             titleState:.normal, btnImage: "play.png",
                                             imageState:.normal,
                                             target: self,
                                             action: Selector(""),
                                             actionEvent: .touchDown)
            self.addSubview(playOrStopBtn)
            
            nameLab = UILabel
                          .init(frame: CGRect.init(x:iconImgVw
                                                     .frame.maxX+30,
                                                   y:iconImgVw
                                                    .frame.minY+50,
                                                   width: 200,
                                                   height: 20))
            nameLab!.text = "😜"
            nameLab!.textColor = UIColor.black
            self.addSubview(nameLab!)
            
            descLab = UILabel
                .init(frame: CGRect.init(x:nameLab!
                    .frame.minX,
                                         y:nameLab!
                                            .frame.maxY+20,
                                         width: 200,
                                         height: 20))
            descLab!.text = "为美丽的世界献上祝福！"
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
    func playOrStopAction(btn: UIButton) {
        if (musicPlayer?.getInstance().isPlaying == true) {
            showMusicSwitch?.stopAnimation()
        }else{
            showMusicSwitch?.startAnimation()
        }
    }
}

extension TimeTableHeaderView{
    //通知的方法
    /*
     *  TODO 通知
     */
    func ohTheDayIsComing(_ userNotification:Notification) {
        var dic:Dictionary = userNotification.userInfo!
        let message:String = dic["time"] as! String
        /*
         *  TODO 字符串比较知识点
         *  https://www.aliyun.com/jiaocheng/363099.html
         */
        if (message.compare("prince").rawValue == 0)  {
            nameLab!.text = "Happy BirthDay!"
            descLab!.text = "为美丽的公主献上祝福！"
        }
        if (message.compare("alwaysPrince").rawValue == 0)  {
            nameLab!.text = "为平凡的自己献上祝福！"
            descLab!.text = "为每天的自己献上祝福！"
        }
    }
}
