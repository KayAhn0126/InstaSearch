//
//  SearchCollectionViewCell.swift
//  InstaSearch
//
//  Created by Kay on 2022/08/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() { // UICollectionViewCell 안에있는 메서드
        super.prepareForReuse() // subclass에서는 왜 super클래스의 메서드를 호출해야 할까? 자세히 알아보자!
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
