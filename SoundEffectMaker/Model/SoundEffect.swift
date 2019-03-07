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
    
    public var title: String?
    public var backgroundColor: Int?
    public var directory: String?
    public var fileName: String?
    public var filePath: String?
    
    
    init(identifier: String) {
        self.identifier = identifier
    }
}
