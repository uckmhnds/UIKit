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
    var isOpened: Bool
    var viewedSize: Int { return isOpened ? size + 1 : 1}
}

class ViewController: UIViewController {
    
    var sections: [Section] = [Section(type: .sectionA, size: 8, isOpened: false),
                               Section(type: .sectionB, size: 10, isOpened: false),
                               Section(type: .sectionC, size: 12, isOpened: false)]
    
    
    private lazy var tableView: UITableView = {
        
        let view = UITableView(frame: .zero, style: .plain)
        
        view.register(CellA.self, forCellReuseIdentifier: CellA.identifier)
        view.register(CellB.self, forCellReuseIdentifier: CellB.identifier)
        view.register(CellC.self, forCellReuseIdentifier: CellC.identifier)
        
        view.register(CellAA.self, forCellReuseIdentifier: CellAA.identifier)
        view.register(CellBB.self, forCellReuseIdentifier: CellBB.identifier)
        view.register(CellCC.self, forCellReuseIdentifier: CellCC.identifier)
        
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    func getSectionType(forSection: Int) -> SectionTypes {
        return sections[forSection].type
    }
    
    func getSectionSize(forSection: Int) -> Int {
        return sections[forSection].viewedSize
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
            if indexPath.row == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellA.identifier, for: indexPath) as? CellA else {return UITableViewCell()}
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellAA.identifier, for: indexPath) as? CellAA else {return UITableViewCell()}
                return cell
            }
            
        case .sectionB:
            if indexPath.row == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellB.identifier, for: indexPath) as? CellB else {return UITableViewCell()}
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellBB.identifier, for: indexPath) as? CellBB else {return UITableViewCell()}
                return cell
            }
            
        case .sectionC:
            if indexPath.row == 0{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellC.identifier, for: indexPath) as? CellC else {return UITableViewCell()}
                return cell
            }else{
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellCC.identifier, for: indexPath) as? CellCC else {return UITableViewCell()}
                return cell
            }
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            sections[indexPath.section].isOpened.toggle()
            
            tableView.reloadSections([indexPath.section], with: .none)
        }else{
            
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

class CellAA: UITableViewCell {
    
    static let identifier: String = "CellAA"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemRed
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

class CellBB: UITableViewCell {
    
    static let identifier: String = "CellBB"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemYellow
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

class CellCC: UITableViewCell {
    
    static let identifier: String = "CellCC"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
