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
    
    private var _recorder: AVAudioRecorder!
    private var _player: AVAudioPlayer!
    private var _isRecording = false
    private var _isPlaying = false
    
    private var _soundEffect = SoundEffect(identifier: "10")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewController()
        setupViews()
        setupLayout()
        
        _soundEffect.title = "テスト録音"
        _soundEffect.directory = Utility.getDocumentDirectory().absoluteString
        _soundEffect.fileName = "\(Utility.getNowDateTimeString()).m4a"
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
        print("click Play!")
        
        if _isPlaying {
            _player.stop()
            _isPlaying = false
            
            _label.text = "待機中"
            _play.setTitle("再生", for: .normal)
            _record.isEnabled = true
            
        } else {
            let url = URL(string: "\(_soundEffect.directory!)/\(_soundEffect.fileName!)")!
            _player = try! AVAudioPlayer(contentsOf: url)
            _player.delegate = self
            _player.play()
            
            _isPlaying = true
            
            _label.text = "再生中"
            _play.setTitle("停止", for: .normal)
            _record.isEnabled = false
        }
        
    }
    
    
    @objc private func tapRecord(sender: UIButton) {
        print("click Record!")
        
        if _isRecording {
            _recorder.stop()
            _isRecording = false
            
            _label.text = "待機中"
            _record.setTitle("録音", for: .normal)
            _play.isEnabled = true
            
        } else {
            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try! session.setActive(true)
            
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 44100,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            let url = URL(string: "\(_soundEffect.directory!)/\(_soundEffect.fileName!)")!
            _recorder = try! AVAudioRecorder(url: url, settings: settings)
            _recorder.delegate = self
            _recorder.record()
            
            _isRecording = true
            
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
