//
//  TableViewController.swift
//  SheetPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 12.10.2022.
//

import UIKit

protocol SheetViewControllerDelegate {
    func sheetViewControllerDidSelect(item: String)
}

class SheetViewController: UIViewController {
    
    private let items = Range(0...20).map { "\($0)" }
    
    var delegate: SheetViewControllerDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func onTap(sender: UITapGestureRecognizer) {

        self.view.window?.removeGestureRecognizer(sender)
        self.dismiss(animated: true, completion: nil)
    }
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(sender:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        tap.cancelsTouchesInView = false
        return tap
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        
        tapRecognizer.delegate = self
        self.view.window?.addGestureRecognizer(tapRecognizer)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }

}

extension SheetViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell        = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        var content     = cell.defaultContentConfiguration()
        
        content.text    = "Item \(indexPath.row)"
        
        cell.contentConfiguration   = content
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item    = items[indexPath.row]
        
        if let delegate = delegate {
            delegate.sheetViewControllerDidSelect(item: item)
        }
    }
}


extension SheetViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let location = touch.location(in: self.view)

        if self.view.point(inside: location, with: nil) {
            return false
        }
        else {
            return true
        }
    }
}
