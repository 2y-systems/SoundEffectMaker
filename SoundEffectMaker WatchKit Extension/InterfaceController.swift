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

    private var _soundEffect = SoundEffect(identifier: "10")
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        _soundEffect.title = "test"
        _soundEffect.directory = ""
        _soundEffect.fileName = Bundle.main.path(forResource: "test/test", ofType: "m4a")
        
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
        SoundEffectManager.instance.play(soundEffect: _soundEffect)
    }
}
