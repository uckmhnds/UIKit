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
    case fourthSection
    case fifthSection
}

class ViewController: UIViewController {
    
    private let sections = [Section.firstSection,
                            Section.secondSection,
                            Section.thirdSection,
                            Section.fourthSection,
                            Section.fifthSection]
    
    private var collectionView: UICollectionView?
    
    private func createCollectionView() -> UICollectionView {
        
        let layout      = self.createLayout()
        
        let view        = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
        view.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.identifier)
        view.register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: ThirdCollectionViewCell.identifier)
        view.register(FourthCollectionViewCell.self, forCellWithReuseIdentifier: FourthCollectionViewCell.identifier)
        view.register(FifthCollectionViewCell.self, forCellWithReuseIdentifier: FifthCollectionViewCell.identifier)
        
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
                
                section.boundarySupplementaryItems      = [self.supplementaryHeaderItem(), self.supplementaryFooterItem()]
                
                return section
                
            case .secondSection:
                
                let item = CompositionalLayout.createItem(width: .fractionalWidth(1),
                                                          height: .fractionalHeight(1),
                                                          spacing: 5)
                
                let group = CompositionalLayout.createGroup(alignment: .vertical,
                                                            width: .fractionalWidth(1),
                                                            height: .fractionalHeight(0.2),
                                                            items: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets                   = .init(top: 30, leading: 0, bottom: 0, trailing: 0)
                section.orthogonalScrollingBehavior     = .continuous
                
                return section
                
            case .thirdSection:
                
                let item = CompositionalLayout.createItem(width: .fractionalWidth(1),
                                                          height: .fractionalHeight(1),
                                                          spacing: 5)
                
                let group = CompositionalLayout.createGroup(alignment: .vertical,
                                                            width: .fractionalWidth(1),
                                                            height: .fractionalHeight(0.2),
                                                            items: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.contentInsets                   = .init(top: 30, leading: 0, bottom: 0, trailing: 0)
                section.orthogonalScrollingBehavior     = .groupPaging
                
                return section
                
            case .fourthSection:
                
                let item        = CompositionalLayout.createItem(width: .fractionalWidth(0.5),
                                                                 height: .fractionalHeight(1),
                                                                 spacing: 8)
                
                let group       = CompositionalLayout.createGroup(alignment: .horizontal,
                                                                  width: .fractionalWidth(1),
                                                                  height: .fractionalHeight(0.3),
                                                                  item: item,
                                                                  count: 2)
                
                let section     = NSCollectionLayoutSection(group: group)
                
                section.contentInsets                   = .init(top: 30, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            case .fifthSection:
                
                let item        = CompositionalLayout.createItem(width: .fractionalWidth(1),
                                                                 height: .fractionalHeight(1),
                                                                 spacing: 8)
                
                let group       = CompositionalLayout.createGroup(alignment: .horizontal,
                                                                  width: .fractionalWidth(1),
                                                                  height: .fractionalHeight(0.3),
                                                                  item: item,
                                                                  count: 1)
                
                let section     = NSCollectionLayoutSection(group: group)
                
                section.contentInsets                   = .init(top: 30, leading: 0, bottom: 0, trailing: 0)
                
                return section
            }
            
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(50)),
              elementKind: Header.identifier,
              alignment: .top)
    }
    
    private func supplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(50)),
              elementKind: Footer.identifier,
              alignment: .bottom)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView              = createCollectionView()
        
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.delegate     = self
        collectionView?.dataSource   = self
        
        collectionView?.register(Header.self, forSupplementaryViewOfKind: Header.identifier, withReuseIdentifier: Header.identifier)
        collectionView?.register(Footer.self, forSupplementaryViewOfKind: Footer.identifier, withReuseIdentifier: Footer.identifier)
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        collectionView?.frame        = view.bounds
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
            return 5
        case .fourthSection:
            return 20
        case .fifthSection:
            return 10
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
            
        case .fourthSection:
            
            guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: FourthCollectionViewCell.identifier, for: indexPath) as?
                    FourthCollectionViewCell else {return UICollectionViewCell()}
            return cell
            
        case .fifthSection:
            
            guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: FifthCollectionViewCell.identifier, for: indexPath) as?
                    FifthCollectionViewCell else {return UICollectionViewCell()}
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind{
        case Header.identifier:
            
            let header      = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.identifier, for: indexPath)

            header.backgroundColor  = .systemPink
            
            return header
            
        case Footer.identifier:
            
            let footer      = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Footer.identifier, for: indexPath)

            footer.backgroundColor  = .systemYellow
            
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    
}

class Header: UICollectionReusableView {
    
    static let identifier       = "Header"
    
    private let label: UILabel  = {
        
        let label   = UILabel()
        
        label.text  = "I am a Header"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    func setup(with title: String) {
        label.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame     = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


class Footer: UICollectionReusableView {
    
    static let identifier       = "Footer"
    
    private let label: UILabel  = {
        
        let label   = UILabel()
        
        label.text  = "I am a Footer"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    func setup(with title: String) {
        label.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame     = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
