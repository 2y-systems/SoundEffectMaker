//
//  SoundEffectManager.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/03/07.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import Foundation
import AVFoundation

class SoundEffectManager: NSObject, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    public static let instance: SoundEffectManager = SoundEffectManager()

    public private(set) var isRecording = false
    public private(set) var isPlaying = false
    
    private var _player: AVAudioPlayer!
    private var _recorder: AVAudioRecorder!
    
    
    private override init() {}
    
    
    public func play(soundEffect: SoundEffect) {
        print("SoundEffectManager: play")
        
        if isPlaying {
            stopPlay()
        }
        
        let url = URL(string: "\(soundEffect.directory!)/\(soundEffect.fileName!)")!
        _player = try! AVAudioPlayer(contentsOf: url)
        _player.delegate = self
        _player.play()
        
        isPlaying = true
    }
    
    
    public func record(soundEffect: SoundEffect) {
        print("SoundEffectManger: Record!")
        
        if isRecording {
            stopRecord()
        }
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord,
                                 with: AVAudioSessionCategoryOptions.allowBluetoothA2DP)
        try! session.setActive(true)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        let url = URL(string: "\(soundEffect.directory!)/\(soundEffect.fileName!)")!
        _recorder = try! AVAudioRecorder(url: url, settings: settings)
        _recorder.delegate = self
        _recorder.record()
        
        isRecording = true
    }
    
    
    public func stopPlay() {
        _player.stop()
        isPlaying = false
    }
    
    
    public func stopRecord() {
        _recorder.stop()
        isRecording = false
    }
    
    
    public func stop() {
        stopPlay()
        stopRecord()
    }
}

