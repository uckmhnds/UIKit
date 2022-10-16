//
//  ViewController.swift
//  StandardTableView
//
//  Created by Abdurrahman Gazi Yavuz on 13.10.2022.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    
    var model = Model()
    
    private let tableView: UITableView = {
        
        let view = UITableView(frame: .zero,
                               style: .plain)
        
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        return view
        
    }()
    
    private lazy var addButton: UIButton = {
        
        let genericAction   = UIAction(title: "",
                                       subtitle: nil,
                                       image: nil,
                                       identifier: nil,
                                       discoverabilityTitle: nil,
                                       state: .off) { _ in
            // Do some stuff here
            
            print("addButton")
            
            self.model.addNewItemToBottom()
            
            self.tableView.reloadData()
        }
        
        let image       = UIImage(systemName: "plus")
        
        let frame       = CGRect(x: view.frame.width - 60 - 30,
                                 y: view.frame.height - 60 - 80,
                                 width: 60,
                                 height: 60)
        
        let button      = UIButton(frame: frame, primaryAction: genericAction)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .systemPink
        
        button.layer.cornerRadius = 30
        
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    // Scroll Down Refresh
    
    private lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl  = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(didScrollDownToRefresh), for: .valueChanged)
        
        refreshControl.tintColor    = .white
        
        return refreshControl
        
    }()
    
    @objc private func didScrollDownToRefresh(){
        
        tableView.refreshControl?.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [weak self] in
            
            print("Refreshing...")
            
            self?.tableView.refreshControl?.endRefreshing()
            
        }
        
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        view.addSubview(tableView)
        view.addSubview(addButton)
        
        tableView.delegate                  = self
        tableView.dataSource                = self
        
        tableView.dragInteractionEnabled    = true
        tableView.dragDelegate              = self
        tableView.dropDelegate              = self
        
        tableView.refreshControl            = refreshControl
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
    }
    
}
