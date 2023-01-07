//
//  ViewController.swift
//  ExpandableView
//
//  Created by Abdurrahman Gazi Yavuz on 1/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    var isCollapsedArray: [Bool] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(ExpandableCell.self, forCellReuseIdentifier: ExpandableCell.identifier)
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        for i in 0..<15 {
            isCollapsedArray.append(i % 2 == 0)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isCollapsedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpandableCell.identifier, for: indexPath) as! ExpandableCell

        cell.setData("Top \(indexPath.row)", str2: "Bottom \(indexPath.row)\n2\n3\n4\n5", isCollapsed: isCollapsedArray[indexPath.row])

        cell.didChangeHeight = { [weak self] isCollapsed in
            guard let self = self else { return }
            // update our data source
            self.isCollapsedArray[indexPath.row] = isCollapsed
            // tell the tableView to re-run its layout
            self.tableView.performBatchUpdates(nil, completion: nil)
        }

        return cell
    }
}

