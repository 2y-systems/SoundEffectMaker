//
//  InterfaceController.swift
//  SoundEffectMaker WatchKit Extension
//
//  Created by user1 on 2019/02/28.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation


class InterfaceController: WKInterfaceController {

    private var _soundEffect = SoundEffect()
    
    @IBOutlet var _label: WKInterfaceLabel!
    @IBOutlet var _play: WKInterfaceButton!
    @IBOutlet var _record: WKInterfaceButton!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        _soundEffect.title = "test"
        _soundEffect.filePath = "\(Utility.getDocumentDirectory())\(Utility.getDocumentDirectory()).m4a"
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func tapPlay() {
        let seManager = WatchSoundEffectManager.instance
        
        if seManager.isPlaying {
            seManager.stopPlay()
            
            DispatchQueue.main.async {
                self._label.setText("待機中")
                self._play.setTitle("再生")
                self._record.setEnabled(true)
            }
        } else {
            seManager.play(soundEffect: _soundEffect)
            
            DispatchQueue.main.async {
                self._label.setText("再生中")
                self._play.setTitle("停止")
                self._record.setEnabled(false)
            }
        }
    }
    
    @IBAction func tapRecord() {
        let seManager = WatchSoundEffectManager.instance
        
        if seManager.isRecording {
            seManager.stopRecord()
            
            DispatchQueue.main.async {
                self._label.setText("待機中")
                self._record.setTitle("録音")
                self._play.setEnabled(true)
            }
        } else {
            seManager.record(soundEffect: _soundEffect)
            
            DispatchQueue.main.async {
                self._label.setText("録音中")
                self._record.setTitle("停止")
                self._play.setEnabled(false)
            }
        }
    }
}
