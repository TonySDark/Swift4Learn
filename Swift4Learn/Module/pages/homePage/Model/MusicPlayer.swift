//
//  MusicPlayer.swift
//  Swift4Learn
//
//  Created by Tony on 2018/5/21.
//  Copyright © 2018年 tony. All rights reserved.
//

import UIKit
import AVFoundation


final class MusicPlayer: NSObject {
    
    static var instancePlayer: AVAudioPlayer? = nil
    
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
        var path =  Bundle.main.path(forResource: "5", ofType: "mp3")
        var pathURL:URL = URL.init(fileURLWithPath: path!)
     }
    static func play(){
        instancePlayer?.play()
    }
    
    static func pause(){
        instancePlayer?.pause()
    }
}
