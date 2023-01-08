//
//  ViewController.swift
//  DynamicTableView
//
//  Created by Abdurrahman Gazi Yavuz on 1/7/23.
//

import UIKit

enum SectionTypes { case sectionA, sectionB, sectionC }

struct Section{
    let type: SectionTypes
    var size: Int
}

class ViewController: UIViewController {
    
    var sections: [Section] = [Section(type: .sectionA, size: 1),
                               Section(type: .sectionB, size: 10),
                               Section(type: .sectionA, size: 1),
                               Section(type: .sectionB, size: 12),
                               Section(type: .sectionC, size: 12)]
    
    
    private lazy var tableView: UITableView = {
        
        let view = UITableView(frame: .zero, style: .plain)
        
        view.register(CellA.self, forCellReuseIdentifier: CellA.identifier)
        view.register(CellB.self, forCellReuseIdentifier: CellB.identifier)
        view.register(CellC.self, forCellReuseIdentifier: CellC.identifier)
        
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    func getSectionType(forSection: Int) -> SectionTypes {
        return sections[forSection].type
    }
    
    func getSectionSize(forSection: Int) -> Int {
        return sections[forSection].size
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSectionSize(forSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch getSectionType(forSection: indexPath.section) {
            
        case .sectionA:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellA.identifier, for: indexPath) as? CellA else {return UITableViewCell()}
            return cell
            
        case .sectionB:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellB.identifier, for: indexPath) as? CellB else {return UITableViewCell()}
            return cell
            
        case .sectionC:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CellC.identifier, for: indexPath) as? CellC else {return UITableViewCell()}
            return cell
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0{
//            sections.remove(at: 1)
//            tableView.reloadData()
        }
        
    }
    
    
}

class CellA: UITableViewCell {
    
    static let identifier: String = "CellA"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class CellB: UITableViewCell {
    
    static let identifier: String = "CellB"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class CellC: UITableViewCell {
    
    static let identifier: String = "CellC"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
