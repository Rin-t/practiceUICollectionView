//
//  CollectionViewCell.swift
//  practiceCollectionView
//
//  Created by Rin on 2021/04/21.
//

import UIKit

protocol CollectionViewCellDelegate: class {
    func receiveButtonCurrentTitle(buttonTitel: String)
    func changeButtonStatus(button: UIButton)
}


class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var button: UIButton!
    
    var collectionViewCellDelegate: CollectionViewCellDelegate?
    
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
 
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        collectionViewCellDelegate?.receiveButtonCurrentTitle(buttonTitel: buttonTitle)
        collectionViewCellDelegate?.changeButtonStatus(button: sender)
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
}
