//
//  SearchCollectionViewCell.swift
//  InstaSearch
//
//  Created by Kay on 2022/08/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() { // UICollectionReusableView 안에있는 메서드
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
