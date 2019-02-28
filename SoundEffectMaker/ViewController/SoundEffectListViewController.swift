//
//  ViewController.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/02/28.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import UIKit

class SoundEffectListViewController: UIViewController {
    
    var _label: UILabel!
    var _button: RoundButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViewController()
        setupViews()
        setupLayout()
    }
    
    
    func setupViewController() {
        self.title = "効果音一覧"
        self.view.backgroundColor = UIColor.lightGray
        
        // ナビゲーションバーのボタン
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAdd))
        self.navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    
    func setupViews() {
        // ラベル
        _label = UILabel()
        _label.text = "Hello world!!"
        view.addSubview(_label)
        
        // ボタン
        _button = RoundButton()
        _button.setTitle("Next", for: .normal)
        _button.addTarget(self, action: #selector(tapNext), for: .touchUpInside)
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
    
    
    @objc private func tapAdd(sender: UIBarButtonItem) {
        print("click Add!")
        
        let nextvc = UINavigationController(rootViewController: RecordViewController())
        self.present(nextvc, animated: true, completion: nil)
    }
    
    
    @objc private func tapNext(sender: UIButton) {
        print("click Next!")
        
        self.navigationController?.pushViewController(RecordViewController(), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

