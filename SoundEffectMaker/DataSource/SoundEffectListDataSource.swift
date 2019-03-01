//
//  SoundEffectListDataSource.swift
//  SoundEffectMaker
//
//  Created by user1 on 2019/03/01.
//  Copyright © 2019年 Yuki Yoshinaga. All rights reserved.
//

import UIKit

class SoundEffectListDataSource: NSObject {
    private var _items: [SoundEffect] = []
    
    
    public func updateItems(items: [SoundEffect]) {
        _items = items
    }
}

extension SoundEffectListDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: SoundEffectListCell.cellIdentifier, for: indexPath) as! SoundEffectListCell
        
        if (cell == nil) {
            cell = SoundEffectListCell()
        }
        
        cell.updateCell(item: _items[indexPath.row])
        
        return cell
    }
}
