//
//  MusicPlayer.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/21.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit
import AVFoundation

class MusicPlayer: NSObject,AVAudioPlayerDelegate{
    private var instancePlayer: AVAudioPlayer? = nil
    private var isRandomPlay:Bool?
    private let songsArr:Array<String> = ["5","4","3","2"]
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
    func randomPlaySongs() -> AVAudioPlayer {

        //随机播放
        do {
            instancePlayer?.delegate = nil
            var num:Int = Int(arc4random_uniform(UInt32(songsArr.count-1)))
            //注意这个方法 forResource：不能包含文件后缀名，
            var path =  Bundle.main.path(forResource: String(songsArr[num]), ofType: "mp3")
            var pathURL:URL = URL.init(fileURLWithPath: path!)
            try instancePlayer =   AVAudioPlayer(contentsOf: pathURL)
            instancePlayer?.delegate = self
            instancePlayer?.prepareToPlay()
        } catch is Error {
            instancePlayer = nil
        }
        return instancePlayer!;
    }
    func isTimeToHappyDay() -> Int {
        let BirthDayStr = "20180602 00:00:00"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd HH:mm:SS"
        let birthDate = dateFormatter.date(from: BirthDayStr)
        return Date.init().compare(birthDate!).rawValue
    }
    
    func playTheSong(path:String?){
        print(#function)
        stop()
        instancePlayer?.delegate = nil
        instancePlayer = nil
        do {
            var source = path
            if path == nil {
                if (isTimeToHappyDay() > 0){
                    source = Bundle.main.path(forResource:"2", ofType: "mp3")!
                    //注意这个方法 forResource：不能包含文件后缀名，
                    
                }else{
                    var num:Int = Int(arc4random_uniform(UInt32(songsArr.count-1)))
                    source = Bundle.main.path(forResource: String(num), ofType: "mp3")!
                    //注意这个方法 forResource：不能包含文件后缀名，
                 }
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
//    //下一曲
//    static func nextsong( num:Int)->Bool{
//        var num = num
//        var musicArry:Array<Music>!
//        musicArry=Music.getALL()
//        if isRandomPlay{
//            num = Int(arc4random_uniform(UInt32(musicArry.count-1)))
//        }
//        if(share(model: musicArry[num])){
//            return true
//        }else{
//            return false
//        }
//    }
//    //上一曲
//    static func prevsong(num:Int)->Bool{
//        var num = num
//        var musicArry:Array<Music>!
//        musicArry=Music.getALL()
//        if isRandomPlay{
//            num = Int(arc4random_uniform(UInt32(musicArry.count-1)))
//        }
//        if(share(model: musicArry[num])){
//            return true
//        }else{
//            return false
//        }
//    }
    //声音控制
    func voice(num:Float){
        instancePlayer?.volume=num
    }
    //当前播放的音乐
    func activeSong()->String?{
        print(#function)
        return "activeMusic"
    }
    //是否在播放音乐
    func isPlaying()->Bool{
        print(#function)
        return (instancePlayer?.isPlaying)!
    }
    
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
