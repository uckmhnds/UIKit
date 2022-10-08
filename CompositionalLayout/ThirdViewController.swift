//
//  ThirdViewController.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

enum Section{
    case firstSection
    case secondSection
    case thirdSection
}

class ThirdViewController: UIViewController {
    
    private let sections = [Section.firstSection,
                            Section.secondSection,
                            Section.thirdSection]
    
    private var collectionView: UICollectionView?
    
    private func createCollectionView() -> UICollectionView {
        
        let layout      = self.createLayout()
        
        let view        = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
        view.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.identifier)
        view.register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: ThirdCollectionViewCell.identifier)
        
        return view
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch self.sections[sectionIndex]{
                
            case .firstSection:
                
                let item = CompositionalLayout.createItem(width: .fractionalWidth(0.25),
                                                          height: .fractionalHeight(1),
                                                          spacing: 2)
                
                let topGroup    = CompositionalLayout.createGroup(alignment: .horizontal,
                                                            width: .fractionalWidth(1),
                                                            height: .fractionalHeight(0.5),
                                                            item: item,
                                                            count: 4)
                
                let bottomGroup = CompositionalLayout.createGroup(alignment: .horizontal,
                                                            width: .fractionalWidth(1),
                                                            height: .fractionalHeight(0.5),
                                                            item: item,
                                                            count: 4)
                
                let group = CompositionalLayout.createGroup(alignment: .vertical,
                                                            width: .fractionalWidth(1),
                                                            height: .fractionalHeight(0.3),
                                                            items: [topGroup, bottomGroup])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior     = .continuous
                
                return section
                
            case .secondSection:
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                    heightDimension: .fractionalHeight(1)))
                
                item.contentInsets.leading  = 20
                item.contentInsets.trailing = 20
                item.contentInsets.top      = 5
                item.contentInsets.bottom   = 5
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                                 heightDimension: .fractionalHeight(0.2)),
                                                               subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior     = .continuous
                
                return section
                
            case .thirdSection:
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                    heightDimension: .fractionalHeight(1)))
                
                item.contentInsets.leading  = 20
                item.contentInsets.trailing = 20
                item.contentInsets.top      = 5
                item.contentInsets.bottom   = 5
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                                 heightDimension: .fractionalHeight(0.2)),
                                                               subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior     = .groupPaging
                
                return section
            }
            
        }
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

extension ThirdViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch sections[section]{
        case .firstSection:
            return 16
        case .secondSection:
            return 20
        case .thirdSection:
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch sections[indexPath.section]{

        case .firstSection:
            guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as?
                    FirstCollectionViewCell else {return UICollectionViewCell()}
            return cell
        case .secondSection:
            guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.identifier, for: indexPath) as?
                    SecondCollectionViewCell else {return UICollectionViewCell()}
            return cell
        case .thirdSection:
            guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.identifier, for: indexPath) as?
                    ThirdCollectionViewCell else {return UICollectionViewCell()}
            return cell
        }
        
    }
    
    
}
