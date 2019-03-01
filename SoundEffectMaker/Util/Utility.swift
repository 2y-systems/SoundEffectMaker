//
//  Utility.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/03/01.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import Foundation

class Utility {
    public static func getNowDateTimeString() -> String {
        let now = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        
        return format.string(from: now)
    }
    
    public static func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
