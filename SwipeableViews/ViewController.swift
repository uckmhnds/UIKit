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
    
    private let prevButton: UIButton = {
        let button      = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints    = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(nil, action: #selector(prevButtonEvent), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button      = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints    = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemPink, for: .normal)
        button.addTarget(nil, action: #selector(nextButtonEvent), for: .touchUpInside)
        return button
    }()
    
    private lazy var pageControl : UIPageControl = {
        let pc                              = UIPageControl()
        pc.numberOfPages                    = self.numberOfPages
        pc.currentPage                      = 0
        pc.currentPageIndicatorTintColor    = .systemPink
        pc.pageIndicatorTintColor           = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    fileprivate func setBottomControls() {
        
        let bottomControlStackView  = UIStackView(arrangedSubviews: [self.prevButton, self.pageControl, self.nextButton])
        
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints    = false
        bottomControlStackView.distribution = .fillEqually
        
        self.view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
            bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func nextButtonEvent() {
        
        let nextIndex = min(self.pageControl.currentPage + 1, self.numberOfPages - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        self.pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func prevButtonEvent() {
        
        let nextIndex = max(self.pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        self.pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor    = .systemRed
        
        view.addSubview(collectionView)
        
        collectionView.isPagingEnabled  = true
        
        collectionView.delegate         = self
        collectionView.dataSource       = self
        
        setBottomControls()
        
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
        
        cell.backgroundColor    = indexPath.item % 2 == 0 ? .systemGray3 : .systemGray4
        
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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let scrollOffsetX   = targetContentOffset.pointee.x
        let frameWidth      = view.frame.width
        
        pageControl.currentPage = Int(scrollOffsetX / frameWidth)
        
    }
    
}
