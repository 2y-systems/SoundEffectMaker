//
//  RecordViewController.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/02/28.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    
    private var _status: UILabel!
    private var _record: UIButton!
    
    private var _soundEffect = SoundEffect()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupViews()
        setupLayout()
        
        _soundEffect.title = "録音"
        _soundEffect.filePath = "\(Utility.getDocumentDirectory().absoluteString)/\(Utility.getNowDateTimeString()).m4a"
    }
    
    
    func setupViewController() {
        self.title = "効果音作成"
        self.view.backgroundColor = UIColor.lightGray
        
        // ナビゲーションバーのボタン
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapCancel))
        self.navigationItem.setLeftBarButton(cancelButton, animated: true)
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tapSave))
        self.navigationItem.setRightBarButton(saveButton, animated: true)
    }
    
    
    func setupViews() {
        // ステータス
        _status = UILabel()
        _status.text = "Status"
        view.addSubview(_status)
        
        // 録音ボタン
        _record = UIButton()
        _record.setTitle("録音", for: .normal)
        _record.setTitleColor(UIColor.white, for: .normal)
        _record.addTarget(self, action: #selector(tapRecord), for: .touchUpInside)
        view.addSubview(_record)
    }
    
    
    func setupLayout() {
        // ステータス
        _status.translatesAutoresizingMaskIntoConstraints = false
        _status.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _status.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 録音ボタン
        _record.translatesAutoresizingMaskIntoConstraints = false
        _record.topAnchor.constraint(equalTo: _status.bottomAnchor, constant: 10).isActive = true
    }
    
    
    @objc private func tapCancel(sender: UIBarButtonItem) {
        print("click Cancel!")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func tapSave(sender: UIBarButtonItem) {
        print("click Save!")
        
        DataManager.instance.soundEffects.append(_soundEffect)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func tapRecord(sender: UIButton) {
        let seManager = SoundEffectManager.instance
        
        if seManager.isRecording {
            seManager.stopRecord()
            _status.text = "待機中"
            _record.setTitle("録音", for: .normal)
        } else {
            seManager.record(soundEffect: _soundEffect)
            _status.text = "録音中"
            _record.setTitle("停止", for: .normal)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
