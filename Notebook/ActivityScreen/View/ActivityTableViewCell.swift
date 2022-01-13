//
//  ActivityTableViewCell.swift
//  Notebook
//
//  Created by Egor Slobodskoy on 12.01.2022.
//

import UIKit

enum ActivityConstants {
    static let cellHeight = UIScreen.main.bounds.height * 0.1
    static var avatarSize: Double = {
        return ActivityConstants.cellHeight * 0.7
    }()
}

final class ActivityTableViewCell: UITableViewCell {
    
    
    private let containerView = UIView()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "EmptyAvatar")
        )
        imageView.frame.size = CGSize(width: ActivityConstants.avatarSize, height: ActivityConstants.avatarSize)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    func configure(data: ) {
    //
    //    }
    
    private func setupUI() {
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(containerView)
        
        setupLabels()
        setupAvatar()
    }
    
    private func setupAvatar() {
        containerView.addSubview(avatarImageView)
    }
    
    private func setupLabels() {
        containerView.addSubview(nameLabel)
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: containerView.superview?.leftAnchor ?? contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: containerView.superview?.topAnchor ?? contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: containerView.superview?.rightAnchor ?? contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: containerView.superview?.bottomAnchor ?? contentView.bottomAnchor),
            
            
            avatarImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3),
            avatarImageView.heightAnchor.constraint(equalToConstant: ActivityConstants.avatarSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: ActivityConstants.avatarSize),
            
            
            nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
}

