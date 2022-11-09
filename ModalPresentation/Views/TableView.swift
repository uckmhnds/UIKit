//
//  TableView.swift
//  ModalPresentation
//
//  Created by Abdurrahman Gazi Yavuz on 11/3/22.
//

import UIKit

class TableView: UIView {
    
    private let items: [String] = Range(1...20).map{ "Item \($0)" }
    
    // To dismiss the AdView
    var dismissClosure: (()->())?
    
    @objc func tapHandler(_ g: UITapGestureRecognizer) -> Void {
        dismissClosure?()
    }
    
    private lazy var blurredEffectView: UIVisualEffectView = {
        
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        view.addGestureRecognizer(tapRecognizer)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pickerHolderView: UIView = {
        
        let view = UIView()
        
        view.layer.cornerRadius = 8
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        return view
        
    }()
    
    private func applyConstraints(){
        
        let blurredEffectViewConstraints = [
            
            blurredEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurredEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurredEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurredEffectView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ]
        
        let pickerHolderViewConstraints = [
            
            pickerHolderView.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            pickerHolderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60.0),
            pickerHolderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60.0),
            pickerHolderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -240)
            
        ]
        
        let tableViewConstraints = [

            tableView.topAnchor.constraint(equalTo: pickerHolderView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: pickerHolderView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: pickerHolderView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: pickerHolderView.bottomAnchor)

        ]
        
        NSLayoutConstraint.activate(blurredEffectViewConstraints)
        NSLayoutConstraint.activate(pickerHolderViewConstraints)
        NSLayoutConstraint.activate(tableViewConstraints)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(blurredEffectView)
        addSubview(pickerHolderView)
        
        tableView.dataSource = self
        tableView.delegate = self

        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addSubview(blurredEffectView)
        addSubview(pickerHolderView)

        applyConstraints()
    }
}


extension TableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = items[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
}
