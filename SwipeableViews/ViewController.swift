//
//  ViewController.swift
//  SwipeableViews
//
//  Created by Abdurrahman Gazi Yavuz on 11.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let numberOfPages : Int     = 4
    
    private let marginBetweenCell : Double = 0
    
    private let collectionView: UICollectionView = {
        
        let layout      = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        let view        = UICollectionView(frame: .zero, collectionViewLayout:  layout)
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor    = .systemRed
        
        view.addSubview(collectionView)
        
        collectionView.isPagingEnabled  = true
        
        collectionView.delegate         = self
        collectionView.dataSource       = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        collectionView.frame        = view.bounds
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfPages
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor    = indexPath.item % 2 == 0 ? .systemRed : .systemYellow
        
        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return marginBetweenCell
    }
    
}
