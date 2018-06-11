//
//  MusicPlayer.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/21.
//  Copyright © 2018年 tony. All rights reserved.
//
/*
 *  bug：点击暂停多了，会没有音乐，而且动画也不能点了
 *
 */


protocol zsw_MusicPlayer {
    func randomPlaySongs() -> AVAudioPlayer
    func playTheSong(path:String?)
    func stop()
    func nextsong(num:Int)
    func prevsong(num:Int)
    func voice(num:Float)
    func activeSong()->String?
    func isPlaying()->Bool
}

import UIKit
import AVFoundation

class MusicPlayer: NSObject{
    static let musicPlayer:MusicPlayer? = nil
    private var instancePlayer: AVAudioPlayer? = nil
    var songsArr:Array<String> = ["5","4","3","2"]
    //extension
    private var playingNum:Int = 0
    var isRandomPlaying = false
    static func getMusicPlayer() ->MusicPlayer{
        if musicPlayer == nil {
            return MusicPlayer.init()
        }else{
            return musicPlayer! 
        }
    }
    
    
    func getInstance() -> AVAudioPlayer{
        if (instancePlayer != nil) {
            print(#function)
            print("1")

        }else{
            print(#function)
            print("0")
            instancePlayer = randomPlaySongs()
        }
        instancePlayer?.delegate = self
        return instancePlayer!;
    }
    
    /// 改变播发器列表
    ///
    /// - Parameter list: 参数
    func chageSongList(_ list:Array<String>) {
        self.songsArr = list
    }
    
}
extension MusicPlayer:AVAudioPlayerDelegate{
    /*
     *AVAudioPlayerDelegate
     */
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(#function)
        if flag{
        }else{
            //继续播放 or 记录当前的进度
        }
        playTheSong(path: nil)
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print(#function)
        print(error?.localizedDescription)
    }
}

extension MusicPlayer{
    //  私人定制方法
     func isTimeToHappyDay() -> Bool {
        let BirthDayStartStr = "20180602 00:00:00"
        let BirthDayEndStr = "20180603 23:59:59"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd HH:mm:SS"
        
        let birthDateStart = dateFormatter.date(from: BirthDayStartStr)
        let birthDateEnd = dateFormatter.date(from: BirthDayEndStr)

        let now = Date.init()
        if now.compare(birthDateStart!).rawValue >= 0 && now.compare(birthDateEnd!).rawValue <= 0 {
            return true
        }else{
            return false
        }
        
    }
    func postANotification(){
        var value = ""
        
        if isTimeToHappyDay() {
            value = "prince"
        }else{
            value = "alwaysPrince"
        }
       
        let notification =  Notification.init(name: Notification.Name(rawValue: "TheDayIsComing"), object: nil, userInfo: ["time":value])
        NotificationCenter.default.post(notification)
    }
}

extension MusicPlayer:zsw_MusicPlayer{
    // 响应swift4  向swift开发者学习 分开功能
    //  播放功能
    func randomPlaySongs() -> AVAudioPlayer {
        
        //随机播放
        do {
            instancePlayer?.delegate = nil
            playingNum = Int(arc4random_uniform(UInt32(songsArr.count-1)))
            //注意这个方法 forResource：不能包含文件后缀名，
            var path =  Bundle.main.path(forResource: String(songsArr[playingNum]), ofType: "mp3")
            var pathURL:URL = URL.init(fileURLWithPath: path!)
            try instancePlayer =   AVAudioPlayer(contentsOf: pathURL)
            instancePlayer?.delegate = self
            instancePlayer?.prepareToPlay()
        } catch {
            instancePlayer = nil
        }
        return instancePlayer!;
    }
    func playTheSong(path:String?){
        print(#function)
        stop()
        instancePlayer?.delegate = nil
        instancePlayer = nil
        do {
            var source = path
            if path == nil {
                if (isTimeToHappyDay()){
                    source = Bundle.main.path(forResource:"2", ofType: "mp3")!
                    //注意这个方法 forResource：不能包含文件后缀名，
                    
                }else{
                    playingNum = Int(arc4random_uniform(UInt32(songsArr.count-1)))
                    source = Bundle.main.path(forResource: String(songsArr[playingNum]), ofType: "mp3")!
                    //注意这个方法 forResource：不能包含文件后缀名，
                }
                postANotification()
            }else{
                source = path
            }
            //            print("\n当前歌曲是："+source!+"\n")
            let pathURL:URL = URL.init(fileURLWithPath: source!)
            try instancePlayer = AVAudioPlayer(contentsOf: pathURL)
            instancePlayer?.delegate = self
            instancePlayer?.prepareToPlay()
            instancePlayer?.play()
        } catch{
            print("error !")
        }
        
    }
    //停止
    func stop(){
        print(#function)
        instancePlayer?.stop()
    }
    //下一曲
    func nextsong(num:Int){
        if isRandomPlaying{
            playingNum = Int(arc4random_uniform(UInt32(songsArr.count-1)))
        }else{
            playingNum += 1
            if playingNum > songsArr.count{
                playingNum = 0
            }
        }
        playTheSong(path: Bundle.main.path(forResource:(songsArr[playingNum]), ofType: "mp3"))
    }
    //上一曲
    func prevsong(num:Int){
        if isRandomPlaying{
            playingNum = Int(arc4random_uniform(UInt32(songsArr.count-1)))
        }else{
            playingNum -= 1
            if playingNum < 0{
                playingNum = songsArr.count - 1
            }
        }
        playTheSong(path: Bundle.main.path(forResource:(songsArr[playingNum]), ofType: "mp3"))
    }
    //声音控制
    func voice(num:Float){
        instancePlayer?.volume=num
    }
    //当前播放的音乐
    func activeSong()->String?{
        print(#function)
        return songsArr[playingNum]
    }
    //是否在播放音乐
    func isPlaying()->Bool{
        print(#function)
        return (instancePlayer?.isPlaying)!
    }
    
    
}
