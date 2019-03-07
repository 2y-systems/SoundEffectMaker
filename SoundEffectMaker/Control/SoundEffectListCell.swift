//
//  SoundEffectListCell.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/03/01.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import UIKit

class SoundEffectListCell: UICollectionViewCell {
    
    public static let cellIdentifier: String = "SoundEffectListCell"
    
    private var _button: UIButton!
    private var _label: UILabel!
    private var _soundEffect: SoundEffect!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        setLayout()
        
        self.contentView.backgroundColor = UIColor.white
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setView() {
        _button = UIButton(type: .system)
        _button.addTarget(self, action: #selector(tapPlay), for: .touchUpInside)
        self.contentView.addSubview(_button)
        
        _label = UILabel()
        self.contentView.addSubview(_label)
    }
    
    
    private func setLayout() {
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        _button.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.topAnchor.constraint(equalTo: _button.bottomAnchor, constant: 10).isActive = true
        _label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    
    public func updateCell(item: SoundEffect) {
        _soundEffect = item
        _button.setTitle(item.title, for: .normal)
        _label.text = item.title
    }
    
    
    @objc private func tapPlay(sender: UIButton) {
        SoundEffectManager.instance.play(soundEffect: _soundEffect)
    }
}
