//
//  GenericTableViewCell.swift
//  Navigation
//
//  Created by Abdurrahman Gazi Yavuz on 11/30/22.
//

import UIKit

class GenericTableViewCell: UITableViewCell {
    
    static let identifier = "GenericTableViewCell"
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var arrow: UIImageView = {
        
        let image = UIImage(systemName: "chevron.right")
        let view = UIImageView(image: image!)
        return view
    }()
    
    func setLabel(_ label: String){
        self.label.text = label
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addSubview(label)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(arrow)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        arrow.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        arrow.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
}
