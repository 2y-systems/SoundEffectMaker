//
//  DataManager.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/03/01.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import Foundation

class DataManager: NSObject {
    
    public var soundEffects: [SoundEffect] = [SoundEffect]()
    
    public static let instance: DataManager = DataManager()
    private override init() {}
    
}
