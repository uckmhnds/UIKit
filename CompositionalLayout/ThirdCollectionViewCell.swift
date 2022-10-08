//
//  ThirdCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Abdurrahman Gazi Yavuz on 8.10.2022.
//

import UIKit

struct Message{
    static let messageTitle = "This is the Message Title"
    static let longMessage  = "This is a long message. This is a long message. This is a long message. This is a long message. This is a long message."
}

class ThirdCollectionViewCell: UICollectionViewCell {
    
    static let identifier   = "ThirdCollectionViewCell"
    
    private let customProfileImage: UIImageView = {
        let image                   = UIImage(systemName: "person", withConfiguration: UIImage.SymbolConfiguration(pointSize: 75))
        
        let view                    = UIImageView(image: image)
        view.contentMode            = .scaleAspectFill
        view.backgroundColor        = .white
        view.layer.borderWidth      = 5
        view.layer.masksToBounds    = false
        view.layer.borderColor      = UIColor.black.cgColor
        view.layer.cornerRadius     = view.frame.height / 2
        view.translatesAutoresizingMaskIntoConstraints  = false
        view.contentMode        = .scaleAspectFill
        view.clipsToBounds = true
        
        return view
    }()
    
    private let profileName: UILabel = {
        
        let label   = UILabel()
        
        label.text  = "username"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let profession: UILabel = {
        
        let label   = UILabel()
        
        label.text  = "profession"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let messageTitle: UILabel = {
        
        let label   = UILabel()
        
        label.text  = Message.messageTitle
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let longMessage: UILabel = {
        
        let label   = UILabel()
        
        label.text  = Message.longMessage
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
        
    }()
    
    private func setConstraints(){
        
        let customProfileImageConstraints  = [
            customProfileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            customProfileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ]
        
        let profileNameConstraints  = [
            profileName.centerXAnchor.constraint(equalTo: customProfileImage.centerXAnchor),
            profileName.topAnchor.constraint(equalTo: customProfileImage.bottomAnchor, constant: 5)
        ]
        
        let professionConstraints  = [
            profession.centerXAnchor.constraint(equalTo: profileName.centerXAnchor),
            profession.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 5)
        ]
        
        let messageTitleConstraints  = [
            messageTitle.leadingAnchor.constraint(equalTo: customProfileImage.trailingAnchor, constant: 20),
            messageTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ]
        
        let longMessageConstraints  = [
            longMessage.leadingAnchor.constraint(equalTo: customProfileImage.trailingAnchor, constant: 20),
            longMessage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            longMessage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ]
        
        NSLayoutConstraint.activate(customProfileImageConstraints)
        NSLayoutConstraint.activate(profileNameConstraints)
        NSLayoutConstraint.activate(professionConstraints)
        NSLayoutConstraint.activate(messageTitleConstraints)
        NSLayoutConstraint.activate(longMessageConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        customProfileImage.frame   = contentView.bounds
        
        contentView.addSubview(customProfileImage)
        contentView.addSubview(profileName)
        contentView.addSubview(profession)
        contentView.addSubview(messageTitle)
        contentView.addSubview(longMessage)
        contentView.backgroundColor     = .systemMint
        
        setConstraints()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
