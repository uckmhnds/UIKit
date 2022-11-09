//
//  ViewController.swift
//  ModalPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 11/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    #warning("Swipe ModalView image i.e. bottom to close modalView")
    #warning("Swipe left to present next ModalView image")
    
    //
    // Ad
    //
    
    private lazy var adView: AdView = {
        let view = AdView()
        
        // add closures to custom picker view
        view.dismissClosure = { [weak self] in
            guard let self = self else {
                return
            }
            self.adView.isHidden = true
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //
    // DatePicker
    //
    
    private var selectedDate: Date = Date() {
        didSet {
            datePickerDisplayButton.setNeedsUpdateConfiguration()
        }
    }
    
    private lazy var datePicker: DatePickerView = {
        
        let datePicker = DatePickerView()
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        // hide custom picker view
        datePicker.isHidden = true
        
        // add closures to custom picker view
        
        datePicker.dismissClosure = { [weak self] in
            guard let self = self else {
                return
            }
            self.datePicker.isHidden = true
        }
        
        datePicker.changeClosure = { [weak self] dateValue in
            guard let self = self else {
                return
            }
            
            // Change button subtitle with selected date
            self.selectedDate = dateValue
        }
        
        return datePicker
        
    }()

    @objc func presentDatePickerView(_ sender: Any) {
        datePicker.isHidden = false
    }
    
    private lazy var datePickerDisplayButton: UIButton = {
        
        let button = UIButton()
        
        button.configurationUpdateHandler = { [unowned self] button in
            
            let calendar = Calendar.current
            let day = calendar.component(.day, from: self.selectedDate)
            let month = calendar.component(.month, from: self.selectedDate)
            let year = calendar.component(.year, from: self.selectedDate)
            
            var config = UIButton.Configuration.filled()
            
            config.title = "Date Picker"
            config.subtitle = "\(day)/\(month)/\(year)"
            
            button.configuration = config
            
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        
        // add button action
        button.addTarget(self, action: #selector(presentDatePickerView(_:)), for: .touchUpInside)
        
        return button
        
    }()
    
    //
    // TableView
    //
    
    private lazy var tableView: TableView = {
        
        let view = TableView()
        
        view.isHidden = true
        // add closures to custom picker view
        view.dismissClosure = { [weak self] in
            guard let self = self else {
                return
            }
            self.tableView.isHidden = true
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    @objc func presentTableView(_ sender: Any) {
        tableView.isHidden = false
    }
    
    private lazy var tableViewDisplayButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("TableView", for: [])
        button.configuration = .filled()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        
        // add button action
        button.addTarget(self, action: #selector(presentTableView(_:)), for: .touchUpInside)
        
        return button
        
    }()
    
    //
    // UIMenu
    //
    
    private lazy var menu: UIMenu = {
        
        let copyAction = UIAction(title: "Copy", image: UIImage(systemName: "doc.on.doc")) { _ in
            print("Copy")
        }
        
        let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { _ in
            print("Share")
        }
        
        let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash")) { _ in
            print("Delete")
        }
        
        let menuElements = [copyAction, shareAction, deleteAction]
        let menu = UIMenu(options: .displayInline, children: menuElements)
        
        return menu
    }()
    
    private lazy var menuDisplayButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Menu", for: [])
        button.configuration = .filled()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.showsMenuAsPrimaryAction = true
        button.menu = menu
        
        return button
        
    }()
    
    //
    // UICollectionView
    //
    
    private let iconList: [UIImage] = [UIImage(systemName: "figure.walk")!,
                                       UIImage(systemName: "figure.wave")!,
                                       UIImage(systemName: "airplane")!,
                                       UIImage(systemName: "car.fill")!,
                                       UIImage(systemName: "bolt.car")!,
                                       UIImage(systemName: "bus.fill")!,
                                       UIImage(systemName: "tram.fill")!,
                                       UIImage(systemName: "ferry.fill")!]
    
    private lazy var collectionModalView: CollectionModalView = {
        
        let view = CollectionModalView()
        
        view.isHidden = true
        // add closures to custom picker view
        view.dismissClosure = { [weak self] in
            guard let self = self else {
                return
            }
            self.collectionModalView.isHidden = true
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
        
    }()
    
    @objc fileprivate func longPressOnCell(_ sender: Any){
        print("LongPress")
    }
    
    //
    // StackView
    //
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [datePickerDisplayButton, tableViewDisplayButton, menuDisplayButton])
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 50
        view.distribution = .fillProportionally
        view.alignment = .center
        return view
    }()
    
    //
    // Constraints
    //
    
    private func applyConstraints() {
        
        let guide = view.safeAreaLayoutGuide
        
        let adViewConstraints = [
             adView.topAnchor.constraint(equalTo: guide.topAnchor),
             adView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
             adView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
             adView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ]
        
        let datePickerConstraints = [
             datePicker.topAnchor.constraint(equalTo: guide.topAnchor),
             datePicker.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
             datePicker.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
             datePicker.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ]
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ]
        
        let stackViewConstraints = [
            stackView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: guide.centerYAnchor)
        ]
        
        let collectionViewConstraints = [
            collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 120),
            collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ]
        
        let collectionViewItemConstraints = [
            collectionModalView.topAnchor.constraint(equalTo: guide.topAnchor),
            collectionModalView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            collectionModalView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            collectionModalView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(adViewConstraints)
        NSLayoutConstraint.activate(datePickerConstraints)
        NSLayoutConstraint.activate(tableViewConstraints)
        NSLayoutConstraint.activate(stackViewConstraints)
        NSLayoutConstraint.activate(collectionViewConstraints)
        NSLayoutConstraint.activate(collectionViewItemConstraints)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //#warning("Order of adding process isimportant")
        //#warning("If you add a view after modal view, it would place on top of moda presentation")
        
        view.addSubview(stackView)
        
        view.addSubview(collectionView)
        
        view.addSubview(collectionModalView)
        
        view.addSubview(adView)
        
        view.addSubview(datePicker)
        
        view.addSubview(tableView)
        
        applyConstraints()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        iconList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        
        let image = iconList[indexPath.row]
        
        cell.delegate = self
        cell.setImage(image)
        
        return cell
    }
    
}


extension ViewController: CollectionViewCellGesture{
    
    func collectionViewCellDidLongPress(_ image: UIImage) {
        
        collectionModalView.setImage(image)
        collectionModalView.isHidden = false
        
    }
    
    
}
