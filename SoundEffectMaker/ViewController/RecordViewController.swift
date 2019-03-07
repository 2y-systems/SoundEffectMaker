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
    
    private var _label: UILabel!
    private var _play: UIButton!
    private var _record: UIButton!
    
    private var _soundEffect = SoundEffect(identifier: "10")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupViews()
        setupLayout()
        
        _soundEffect.title = "テスト録音"
        _soundEffect.directory = Utility.getDocumentDirectory().absoluteString
        _soundEffect.fileName = "\(Utility.getNowDateTimeString()).m4a"
        _soundEffect.filePath = "\(_soundEffect.directory!)/\(_soundEffect.fileName!)"
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
        // ラベル
        _label = UILabel()
        _label.text = "Status"
        view.addSubview(_label)
        
        // 再生ボタン
        _play = UIButton()
        _play.setTitle("再生", for: .normal)
        _play.setTitleColor(UIColor.white, for: .normal)
        _play.addTarget(self, action: #selector(tapPlay), for: .touchUpInside)
        _play.isEnabled = false
        view.addSubview(_play)
        
        // 録音ボタン
        _record = UIButton()
        _record.setTitle("録音", for: .normal)
        _record.setTitleColor(UIColor.white, for: .normal)
        _record.addTarget(self, action: #selector(tapRecord), for: .touchUpInside)
        view.addSubview(_record)
    }
    
    
    func setupLayout() {
        // ラベル
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        _label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // 再生ボタン
        _play.translatesAutoresizingMaskIntoConstraints = false
        _play.topAnchor.constraint(equalTo: _label.bottomAnchor, constant: 10).isActive = true
        _play.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        
        // 録音ボタン
        _record.translatesAutoresizingMaskIntoConstraints = false
        _record.topAnchor.constraint(equalTo: _label.bottomAnchor, constant: 10).isActive = true
        _record.leadingAnchor.constraint(equalTo: _play.trailingAnchor, constant: 100).isActive = true
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
    
    
    @objc private func tapPlay(sender: UIButton) {
        let seManager = SoundEffectManager.instance
        
        if seManager.isPlaying {
            seManager.stopPlay()
            _label.text = "待機中"
            _play.setTitle("再生", for: .normal)
            _record.isEnabled = true
        } else {
            seManager.play(soundEffect: _soundEffect)
            _label.text = "再生中"
            _play.setTitle("停止", for: .normal)
            _record.isEnabled = false
        }
    }
    
    
    @objc private func tapRecord(sender: UIButton) {
        let seManager = SoundEffectManager.instance
        
        if seManager.isRecording {
            seManager.stopRecord()
            _label.text = "待機中"
            _record.setTitle("録音", for: .normal)
            _play.isEnabled = true
        } else {
            seManager.record(soundEffect: _soundEffect)
            _label.text = "録音中"
            _record.setTitle("停止", for: .normal)
            _play.isEnabled = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
