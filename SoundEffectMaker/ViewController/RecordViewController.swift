//
//  RecordViewController.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/02/28.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
    var _label: UILabel!
    var _button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupViews()
        setupLayout()
    }
    
    
    func setupViewController() {
        self.title = "効果音作成"
        self.view.backgroundColor = UIColor.brown
    }
    
    
    func setupViews() {
        // ラベル
        _label = UILabel()
        _label.text = "Hello next world!!"
        view.addSubview(_label)
        
        // ボタン
        _button = UIButton(type: .system)
        _button.setTitle("Back", for: .normal)
        _button.addTarget(self, action: #selector(tapBack), for: .touchUpInside)
        view.addSubview(_button)
    }
    
    
    func setupLayout() {
        // ラベル
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // ボタン
        _button.translatesAutoresizingMaskIntoConstraints = false
        _button.topAnchor.constraint(equalTo: _label.bottomAnchor, constant: 10).isActive = true
        _button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
    }
    
    
    @objc private func tapBack(sender: UIButton) {
        print("click Back!")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
