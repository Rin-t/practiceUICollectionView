//
//  CollectionViewCell.swift
//  practiceCollectionView
//
//  Created by Rin on 2021/04/21.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var button: UIButton!
    
    static let identifier = "CollectionViewCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }

    public func configure(text: String) {
        button.setTitle(text, for: .normal)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
}
