//
//  ViewController.swift
//  SegmentedView
//
//  Created by Abdurrahman Gazi Yavuz on 12.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let text            = "text"
    
    private var segmentIndex    = 0
    
    private let firstSegment    = ["firstSegmentRow1", "firstSegmentRow2", "firstSegmentRow3"]
    
    private let secondSegment   = ["secondSegmentRow1", "secondSegmentRow2", "secondSegmentRow3"]
    
    private let thirdSegment    = ["thirdSegmentRow1", "thirdSegmentRow2", "thirdSegmentRow3"]
    
    private lazy var rowsToDisplay  = firstSegment
    
    private lazy var segmentedControl: UISegmentedControl = {
        
        let segmentControl  = UISegmentedControl(items: ["first", "second", "third"])
        
        segmentControl.selectedSegmentIndex = segmentIndex
        segmentControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        
        return segmentControl
    }()
    
    private lazy var tableView: UITableView = {
        let view    = UITableView(frame: .zero, style: .plain)
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        
        let view                = UIStackView(arrangedSubviews: [self.segmentedControl, self.tableView])
        view.axis               = .vertical
        
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    
    @objc fileprivate func handleSegmentChange(){
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            rowsToDisplay   = firstSegment
        case 1:
            rowsToDisplay   = secondSegment
        default:
            rowsToDisplay   = thirdSegment
        }
        
        tableView.reloadData()
    }
    
    private func applyConstraints(){
        let stackViewConstraints    = [
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]

        NSLayoutConstraint.activate(stackViewConstraints)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor    = .systemGray
        navigationItem.title    = "Segmented View"
        
        view.addSubview(stackView)
        
        applyConstraints()
        
        tableView.delegate      = self
        tableView.dataSource    = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    = UITableViewCell()
        cell.textLabel?.text    = rowsToDisplay[indexPath.row]
        return cell
    }
    
}
