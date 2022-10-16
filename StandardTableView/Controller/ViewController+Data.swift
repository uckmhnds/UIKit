//
//  ViewController+Data.swift
//  StandardTableView
//
//  Created by Abdurrahman Gazi Yavuz on 15.10.2022.
//
import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.items.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()

        var content = cell.defaultContentConfiguration()
        
        content.text = model.items[indexPath.row]

        cell.contentConfiguration = content

        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let infoAction  = UIContextualAction(style: .normal, title: nil) { _, _, completion in
            print("Info Action is clicked")

        }
        infoAction.image            = UIImage(systemName: "info.bubble")
        infoAction.backgroundColor  = .systemGray

        let phoneAction = UIContextualAction(style: .normal, title: nil) { _, _, completion in
            print("Phone Action is clicked")
        }

        phoneAction.image               = UIImage(systemName: "phone")
        phoneAction.backgroundColor     = .systemGray2

        // When you put an action into actions array first element, it will be default for long swipe action
        let config      = UISwipeActionsConfiguration(actions: [infoAction, phoneAction])

        // Default first element action
        config.performsFirstActionWithFullSwipe = true


        return config
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let deleteAction  = UIContextualAction(style: .normal, title: nil) { _, _, completion in

            self.model.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)

        }
        
        deleteAction.title            = "Delete"
        deleteAction.backgroundColor  = .systemRed

        // When you put an action into actions array first element, it will be default for long swipe action
        let config      = UISwipeActionsConfiguration(actions: [deleteAction])

        // Default first element action
        config.performsFirstActionWithFullSwipe = true


        return config
    }

    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        let config  = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let genericAction   = UIAction(title: "Generic",
                                           subtitle: nil,
                                           image: nil,
                                           identifier: nil,
                                           discoverabilityTitle: nil,
                                           state: .off) { _ in
                // Do some stuff here
                print("contextMenuConfigurationForRowAt \(indexPath.row)")
            }

            return UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [genericAction])
        }

        return config

    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        model.moveItem(at: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
