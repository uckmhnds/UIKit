//
//  TableViewController.swift
//  SheetPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 12.10.2022.
//

import UIKit

protocol TableViewControllerDelegate {
    func tableViewControllerDidSelect(item: String)
}

class TableViewController: UITableViewController {
    
    private let items = Range(0...20).map { "\($0)" }
    
    var delegate: TableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell        = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        var content     = cell.defaultContentConfiguration()
        
        content.text    = "Item \(indexPath.row)"
        
        cell.contentConfiguration   = content
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item    = items[indexPath.row]
        
        if let delegate = delegate {
            delegate.tableViewControllerDidSelect(item: item)
        }
    }


}
