//
//  ViewController+Drag.swift
//  StandardTableView
//
//  Created by Abdurrahman Gazi Yavuz on 15.10.2022.
//

import UIKit

extension ViewController: UITableViewDragDelegate{
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        print("itemsForBeginning")
        return model.dragItems(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, dragSessionWillBegin session: UIDragSession) {
        // Start editingMode in tableView
        print("dragSessionWillBegin")
        tableView.isEditing = true
    }
    
    func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        // Start editingMode in tableView
        print("dragSessionDidEnd")
        tableView.isEditing = false
    }
    
}
