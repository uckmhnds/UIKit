//
//  SecondViewController.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    
    private func createCollectionView() -> UICollectionView {
        
        let layout      = self.createCompositionalLayout()
        
        let view        = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        return view
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        
        let subItem     = CompositionalLayout.createItem(width: .fractionalWidth(1),
                                                         height: .fractionalHeight(0.5),
                                                         spacing: 1)
        
        let subGroup    = CompositionalLayout.createGroup(alignment: .vertical,
                                                          width: .fractionalWidth(0.5),
                                                          height: .fractionalHeight(1),
                                                          item: subItem,
                                                          count: 2)
        
        let item        = CompositionalLayout.createItem(width: .fractionalWidth(0.5),
                                                         height: .fractionalHeight(1),
                                                         spacing: 1)
        
        let group       = CompositionalLayout.createGroup(alignment: .horizontal,
                                                          width: .fractionalWidth(1),
                                                          height: .fractionalHeight(0.5),
                                                          items: [item, subGroup])
        
        let section     = NSCollectionLayoutSection(group: group)
        
        let layout      = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView              = createCollectionView()
        
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.delegate     = self
        collectionView?.dataSource   = self
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        collectionView?.frame        = view.bounds
    }

}

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        
        return cell
        
    }
    
    
}

