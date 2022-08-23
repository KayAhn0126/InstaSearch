//
//  NewsFeedCollectionViewCell.swift
//  InstaSearch
//
//  Created by Kay on 2022/08/23.
//

import UIKit

class NewsFeedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(with imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
