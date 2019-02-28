//
//  RoundButton.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/02/28.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    public var size = 100
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.addTarget(self, action: #selector(tapAnim), for: .touchDown)
        self.addTarget(self, action: #selector(releaseAnim), for: .touchUpInside)
        self.addTarget(self, action: #selector(releaseAnim), for: .touchUpOutside)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRect(origin: self.frame.origin, size: CGSize(width: size, height: size))
        self.layer.cornerRadius = self.bounds.width * 0.5
    }
    
    
    @objc func tapAnim(sender: UIButton) {
        UIView.animate(withDuration: 100, animations: { () -> Void in
            print("tapAnim")
            let scale = CGFloat(90.0 / 100.0)
            self.transform = self.transform.scaledBy(x: scale, y: scale)
        })
    }
    
    @objc func releaseAnim(sender: UIButton) {
        print("releaseAnim")
        UIView.animate(withDuration: 100, animations: { () -> Void in
            let scale = CGFloat(100.0 / 90.0)
            self.transform = self.transform.scaledBy(x: scale, y: scale)
        })
    }
}
