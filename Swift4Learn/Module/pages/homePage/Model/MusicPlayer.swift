//
//  MusicPlayer.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/21.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit
import AVFoundation


final class MusicPlayer: NSObject,AVAudioPlayerDelegate{
    
    private static var instancePlayer: AVAudioPlayer? = nil
    private static var isRandomPlay:Bool?
    private static let songsArr:Array<String> = ["5.mp3","4.mp3","3.mp3","2.mp3","1.mp3"]
    
    static func getInstance() -> AVAudioPlayer{
        if (instancePlayer != nil) {
            
        }else{
            do {
                var path =  Bundle.main.path(forResource: "5", ofType: "mp3")
                var pathURL:URL = URL.init(fileURLWithPath: path!)
                try instancePlayer =  AVAudioPlayer(contentsOf: pathURL)
                instancePlayer?.prepareToPlay()
        
            } catch is Error {
                instancePlayer = nil
            }
//        });
        }
        return instancePlayer!;
    }
    static func playTheSong(path:String){
        instancePlayer = nil
        do {
            var path =  Bundle.main.path(forResource: "5", ofType: "mp3")
            var pathURL:URL = URL.init(fileURLWithPath: path!)
            try instancePlayer =  AVAudioPlayer(contentsOf: pathURL)
            instancePlayer?.prepareToPlay()
        } catch is Error {
            print(#function)
        }
       
     }
    //停止
    static func stop() ->Bool{
        instancePlayer?.stop()
        if (instancePlayer?.isPlaying)! {
            return false
        }else{
            return true
        }
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
    static func voice(num:Float){
        instancePlayer?.volume=num
    }
    //当前播放的音乐
    static func activeSong()->String?{
        return "activeMusic"
    }
    //是否在播放音乐
    static func isPlaying()->Bool{
        return (instancePlayer?.isPlaying)!
    }
    //随机播放
    
    /*
     *AVAudioPlayerDelegate
     */
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("player" + String(flag))
        if flag{
            // 下一首
            player.stop()
        }else{
            //继续播放 or 记录当前的进度
        }
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print(error?.localizedDescription)
    }
    
}
