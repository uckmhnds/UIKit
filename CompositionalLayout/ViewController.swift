//
//  ThirdViewController.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

#warning("Check combine")

import UIKit
import Combine

enum Section{
    case firstSection
    case secondSection
    case thirdSection
    case fourthSection
    case fifthSection
}

class ViewController: UIViewController {
    
    private let pagingInfoSubject = PassthroughSubject<PagingInfo, Never>()
    
    private let sections = [Section.firstSection,
                            Section.secondSection,
                            Section.thirdSection,
                            Section.fourthSection,
                            Section.fifthSection]
    
    private var collectionView: UICollectionView?
    
    private func createCollectionView() -> UICollectionView {
        
        let layout      = self.createLayout()
        
        // Background decoration
        layout.register(RoundedBackgroundView.self,
                                  forDecorationViewOfKind: RoundedBackgroundView.reuseIdentifier)
        
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
                
                section.decorationItems                 = [self.collectionLayoutBackgroundDecoration]
                
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
                
                section.decorationItems                 = [self.collectionLayoutBackgroundDecoration]
                
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

                section.decorationItems                 = [self.collectionLayoutBackgroundDecoration]
                
                section.boundarySupplementaryItems      += [self.footerBoundarySupplementaryItem]

                section.visibleItemsInvalidationHandler = { [weak self] (items, offset, env) -> Void in
                    guard let self = self else { return }

                    let page = round(offset.x / self.view.bounds.width)

                    self.pagingInfoSubject.send(PagingInfo(sectionIndex: sectionIndex, currentPage: Int(page)))
                }
                
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
                
                section.decorationItems                 = [self.collectionLayoutBackgroundDecoration]
                
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
                
                section.decorationItems                 = [self.collectionLayoutBackgroundDecoration]
                
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
    
    private lazy var footerBoundarySupplementaryItem: NSCollectionLayoutBoundarySupplementaryItem = {
        
        
        
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(20))

        let item = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize,
                                                                              elementKind: PagingSectionFooterView.identifier,
                                                                              alignment: .bottom)
        
        return item
    }()
    
    private lazy var collectionLayoutBackgroundDecoration: NSCollectionLayoutDecorationItem = {
        let item = NSCollectionLayoutDecorationItem.background(elementKind: RoundedBackgroundView.reuseIdentifier)
        return item
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView              = createCollectionView()
        
        view.addSubview(collectionView ?? UICollectionView())
        
        collectionView?.delegate     = self
        collectionView?.dataSource   = self
        
        collectionView?.register(Header.self, forSupplementaryViewOfKind: Header.identifier, withReuseIdentifier: Header.identifier)
        collectionView?.register(Footer.self, forSupplementaryViewOfKind: Footer.identifier, withReuseIdentifier: Footer.identifier)
        collectionView?.register(PagingSectionFooterView.self, forSupplementaryViewOfKind: PagingSectionFooterView.identifier, withReuseIdentifier: PagingSectionFooterView.identifier)
        
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
            
        case PagingSectionFooterView.identifier:
        
            let pagingFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                               withReuseIdentifier: PagingSectionFooterView.identifier,
                                                                               for: indexPath) as! PagingSectionFooterView

            let itemCount = 5
            pagingFooter.configure(with: itemCount)

            pagingFooter.subscribeTo(subject: pagingInfoSubject, for: indexPath.section)

            return pagingFooter
            
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

struct PagingInfo: Equatable, Hashable {
    let sectionIndex: Int
    let currentPage: Int
}

class PagingSectionFooterView: UICollectionReusableView {
    
    static let identifier = "PagingSectionFooterView"
    
    private lazy var pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.isUserInteractionEnabled = true
        control.currentPageIndicatorTintColor = .systemOrange
        control.pageIndicatorTintColor = .systemGray2
        return control
    }()

    private var pagingInfoToken: AnyCancellable?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    func configure(with numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }

    func subscribeTo(subject: PassthroughSubject<PagingInfo, Never>, for section: Int) {
        pagingInfoToken = subject
            .filter { $0.sectionIndex == section }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] pagingInfo in
                self?.pageControl.currentPage = pagingInfo.currentPage
            }
    }

    private func setupView() {
        backgroundColor = .clear

        addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        pagingInfoToken?.cancel()
        pagingInfoToken = nil
    }
}

class RoundedBackgroundView: UICollectionReusableView {
    
    static let reuseIdentifier = "RoundedBackgroundView"
    
    private var insetView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemFill
        view.layer.cornerRadius = 0
        view.clipsToBounds = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(insetView)

        NSLayoutConstraint.activate([
            insetView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            insetView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            insetView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            insetView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
