//
//  HomeViewController.swift
//  Navigation
//
//  Created by Abdurrahman Gazi Yavuz on 11/30/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    
    func test(_ index: Int)
    
    func side()
    
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?
    
    let items: [String] = Range(1...19).map { "Item \($0)" }
    
    private let sidePadding: CGFloat = 8
    private let topPadding: CGFloat = 48
    private let bottomPadding: CGFloat = 12
    
    private lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.register(GenericTableViewCell.self, forCellReuseIdentifier: GenericTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
        
    }()
    
    private func applyConstraints(){

        let tableViewConstraints = [

            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sidePadding),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topPadding),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomPadding),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sidePadding)

        ]

        NSLayoutConstraint.activate(tableViewConstraints)

    }
    
    @objc func sideBar(){
        delegate?.side()
        print("clicked")
    }
    
    private func setNavBar() {
        
        let image = UIImage(systemName: "person")
        let image2 = UIImage(systemName: "line.3.horizontal")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image2, style: .done, target: self, action: #selector(sideBar))
        
        title = "Home"
        
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setNavBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        if parent != nil {
            print("didMovetoParent")
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.test(indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GenericTableViewCell.identifier, for: indexPath) as? GenericTableViewCell else {return UITableViewCell()}
        
        cell.setLabel(items[indexPath.row])
        
        return cell
        
    }
    
}
