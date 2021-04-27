//
//  CollectionViewCell.swift
//  practiceCollectionView
//
//  Created by Rin on 2021/04/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UIView!
    @IBOutlet weak var label: UILabel!
    
    static let identifier = "CollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    //cellの円の外側をタップしたときにcellが選択されないようにする
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let radius:CGFloat = (self.frame.width / 2)
        var point:CGPoint = CGPoint()
        
        if let touch = touches.first {
            point = touch.location(in: self.superview)
        }
        
        let distance:CGFloat = sqrt(CGFloat(powf((Float(self.center.x - point.x)), 2) + powf((Float(self.center.y - point.y)), 2)))
        
        if(distance < radius) {
            super.touchesBegan(touches, with: event)
        }
    }
}
