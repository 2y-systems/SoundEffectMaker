//
//  SoundEffect.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/03/01.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import Foundation

class SoundEffect {
    
    public var identifier: String
    public var title: String
    public var sound: NSData
    public var backgroundColor: Int
    
    init(identifier: String, title: String, sound: NSData, backgroundColor: Int) {
        self.identifier = identifier
        self.title = title
        self.sound = sound
        self.backgroundColor = backgroundColor
    }
    
}
