//
//  MusicEngine.swift
//  ChineseChess
//
//  Created by Chris Xiong on 2019/10/28.
//  Copyright © 2019 org.chris. All rights reserved.
//

import UIKit
import AVFoundation

class MusicEngine: NSObject {
    //音频引擎单例
    static let sharedInstance = MusicEngine()
    //音频播放器
    var player: AVAudioPlayer?
    
    private override init() {
        //获取音频文件，forResource参数为工程中的音频文件明，需要为mp3格式
        let path = Bundle.main.path(forResource: "bgMusic", ofType: "mp3")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        player = try! AVAudioPlayer(data: data)
        //进行音频循环播放次数,-1是y循环播放
        player?.numberOfLoops = -1
    }
    
    //提供一个开始播放背景音频的方法
    func playBackgroundMusic(){
        //如果音频没有在播放状态，进行播放
        if !player!.isPlaying{
            player?.play()
        }
    }
    
    //提供一个停止播放背景音频的方法
    func stopBackgroundMusic(){
        //如果音频在播放，停止
        if player!.isPlaying{
            player?.stop()
        }
    }

}
