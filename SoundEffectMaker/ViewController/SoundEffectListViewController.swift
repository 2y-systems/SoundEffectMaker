//
//  ViewController.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/02/28.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import UIKit

class SoundEffectListViewController: UIViewController {

    var _collectionView: UICollectionView!
    var _collectionLayout: UICollectionViewFlowLayout!
    var _collectionDataSouruce: SoundEffectListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViewController()
        setupViews()
        setupLayout()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        _collectionDataSouruce.updateItems(items: DataManager.instance.soundEffects)
        _collectionView.reloadData()
    }
    
    
    func setupViewController() {
        self.title = "効果音一覧"
        self.view.backgroundColor = UIColor.lightGray
        
        // ナビゲーションバーのボタン
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapAdd))
        self.navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    
    func setupViews() {
        _collectionLayout = UICollectionViewFlowLayout()
        _collectionLayout.minimumLineSpacing = 1
        _collectionLayout.minimumInteritemSpacing = 1
        
        let manager = DataManager.instance
        _collectionDataSouruce = SoundEffectListDataSource()
        _collectionDataSouruce.updateItems(items: manager.soundEffects)
        
        _collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: _collectionLayout)
        _collectionView.dataSource = _collectionDataSouruce
        _collectionView.register(SoundEffectListCell.self, forCellWithReuseIdentifier: SoundEffectListCell.cellIdentifier)
        _collectionView.backgroundColor = UIColor.clear
        _collectionView.delaysContentTouches = false
        view.addSubview(_collectionView)
    }
    
    
    func setupLayout() {
        // コレクションビュー
        _collectionView.translatesAutoresizingMaskIntoConstraints = false
        _collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        _collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        _collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        _collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    
    override func viewDidLayoutSubviews() {
        let size = view.bounds.width * 0.25
        _collectionLayout.itemSize = CGSize(width: size - 1, height: size - 1)
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

