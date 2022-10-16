//
//  Model.swift
//  StandardTableView
//
//  Created by Abdurrahman Gazi Yavuz on 16.10.2022.
//

import Foundation

/// The data model used to populate the table view on app launch.
struct Model {
    
    private(set) var items = Range(0...20).map { "Item \($0)" }
    
    var addNewItemIndex = 21
    
    /// The traditional method for rearranging rows in a table view.
    mutating func moveItem(at sourceIndex: Int, to destinationIndex: Int) {
        guard sourceIndex != destinationIndex else { return }
        
        let item = items[sourceIndex]
        items.remove(at: sourceIndex)
        items.insert(item, at: destinationIndex)
    }
    
    /// The method for adding a new item to the table view's data model.
    mutating func addItem(_ item: String, at index: Int) {
        items.insert(item, at: index)
    }
    
    /// The method for adding a new item to the table view's data model.
    mutating func remove(at index: Int) {
        items.remove(at: index)
    }
    
    /// Add Button Item
    mutating func addNewItemToBottom()  {
        items.insert("Item \(addNewItemIndex)", at: items.count)
        addNewItemIndex += 1
    }
    
    
}
