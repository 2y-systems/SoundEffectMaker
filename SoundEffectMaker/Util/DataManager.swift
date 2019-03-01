//
//  DataManager.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/03/01.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import Foundation

class DataManager: NSObject {
    
    private var soundEffects: [SoundEffect]? = nil
    
    static let instance: DataManager = DataManager()
    private override init() {}
    
}
