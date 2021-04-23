//
//  ViewController.swift
//  practiceCollectionView
//
//  Created by Rin on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var textLabel: UILabel!

    let collectionCell: [String] = ["腕","腹","足","全身"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        let size = collectionView.frame.height
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: size, height: size)
        collectionView.collectionViewLayout = layout
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .systemGray2
        cell.layer.cornerRadius = cell.collectionView.frame.size.height / 2
        cell.clipsToBounds = true
        cell.configure(text: collectionCell[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        textLabel.text = collectionCell[indexPath.row]
    }
    
    
}
