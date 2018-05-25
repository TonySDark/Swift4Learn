//
//  MusicShowView.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/18.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit

class MusicShowView: UIView {
    /// 立方柱的个数
    var numberOfRect = 4;
    /// 立方柱的颜色
    var rectBackgroundColor: UIColor?
    /// 立方柱初始化大小
    var defaultSize: CGSize?
    /// 立方柱之间的间距
    var space: CGFloat = 0.2
//    extension
    weak var musicPlayer:MusicPlayer?
    var imageVw:UIImageView? = nil
    
    
    
    
    deinit {
        print(#function)
    }

    override init(frame: CGRect) {
        //
        super.init(frame: frame)
        self.createDefaultAttribute(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createDefaultAttribute(frame: CGRect) -> Void {
        numberOfRect = 3;
        self.rectBackgroundColor = UIColor.init(red: 200/255, green: 42/255, blue: 55/255, alpha: 1)
        space = 5;
        defaultSize = frame.size
        defaultState()
    }
    func defaultState() {
        imageVw = UIImageView.init(image: UIImage.init(named: "stop.png"))
        imageVw?.frame = self.bounds
        self.addSubview(imageVw!)
    }

    func addAnimateWithDelay(delay: Double) -> CAAnimation {
        let animation = CABasicAnimation.init(keyPath: "transform.rotation.x")
        animation.repeatCount = MAXFLOAT;
        animation.isRemovedOnCompletion = true;
        animation.autoreverses = false;
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = NSNumber.init(value: 0)
        animation.toValue = NSNumber.init(value: Double.pi)
        animation.duration = (Double)(numberOfRect) * 0.2;
        animation.beginTime = CACurrentMediaTime() + delay;
        return animation;
    }
    /**
     *  添加矩形
     */
    func addRect() -> Void {
        self.removeRect()
        for  i in 0...numberOfRect {
            let x = (CGFloat)(i) * (5 + space)
            let rView = UIView.init(frame: CGRect.init(x: x, y: 0, width: 5, height: defaultSize!.height))
            rView.backgroundColor = rectBackgroundColor
            rView.layer.add(self.addAnimateWithDelay(delay: Double(i) * 0.2), forKey: "TBRotate")
            self.addSubview(rView)
        }
    }
    /**
     *  移除矩形
     */
    func removeRect() -> Void {
        parentViewclearAllChildViews(self)
    }
    
    func startAnimation() {
        self.addRect()
    }
    func stopAnimation() {
        self.removeRect()
        defaultState()
    }
}

extension MusicShowView{
    //学习swift 触摸功能 https://www.cnblogs.com/fengmin/p/5713562.html
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showMusic()
    }
    
    @objc func showMusic() {
        print(#function)
        if (musicPlayer?.getInstance().isPlaying == false) {
            startAnimation()
            musicPlayer?.getInstance().play()
        }else{
            stopAnimation()
            musicPlayer?.getInstance().pause()
        }
        
    }
    
}
