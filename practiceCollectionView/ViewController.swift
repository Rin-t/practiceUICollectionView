//
//  ViewController.swift
//  practiceCollectionView
//
//  Created by Rin on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var textLabel: UILabel!

    let collectionCell: [String] = ["１","２","３","４","５","６","７"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        
        let layout = UICollectionViewFlowLayout()
        let size = collectionView.frame.height - 10
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

        //cellの形
        cell.layoutIfNeeded()
        cell.layer.cornerRadius = (cell.collectionView.frame.size.height - 5) / 2
        cell.backgroundColor = .systemYellow
        cell.label.text = collectionCell[indexPath.row]
        
        let selectedBGView = UIView(frame: cell.frame)
        selectedBGView.backgroundColor = .white
        cell.selectedBackgroundView = selectedBGView
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        textLabel.text = collectionCell[indexPath.row]
    }
    
    private func cellLayout(cell: CollectionViewCell) -> CollectionViewCell {

        return cell
    }
    
}

