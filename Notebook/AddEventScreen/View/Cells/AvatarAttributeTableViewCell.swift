//
//  AvatarAttributeTableViewCell.swift
//  Notebook
//
//  Created by Egor Slobodskoy on 13.01.2022.
//

import UIKit

final class AvatarAttributeTableViewCell: UITableViewCell {

    private let containerView = UIView()
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "EmptyAvatar")
        )
        imageView.frame.size = CGSize(width: EventsConstants.avatarSize, height: EventsConstants.avatarSize)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
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
        
        containerView.addSubview(avatarImageView)
        containerView.addSubview(nameLabel)

    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        
        let lessWidthConstraintNameLabel = NSLayoutConstraint(
            item: nameLabel,
            attribute: .width,
            relatedBy: .lessThanOrEqual,
            toItem: containerView,
            attribute: .width,
            multiplier: 0.65,
            constant: 0
        );
        
        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: containerView.superview?.leftAnchor ?? contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: containerView.superview?.topAnchor ?? contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: containerView.superview?.rightAnchor ?? contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: containerView.superview?.bottomAnchor ?? contentView.bottomAnchor),
            
            
            avatarImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3),
            avatarImageView.heightAnchor.constraint(equalToConstant: EventsConstants.avatarSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: EventsConstants.avatarSize),
            
            
            nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 4),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            lessWidthConstraintNameLabel,
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabel.font.lineHeight),
        ])
    }

}
