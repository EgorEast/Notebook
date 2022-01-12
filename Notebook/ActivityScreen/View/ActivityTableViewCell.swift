//
//  ActivityTableViewCell.swift
//  Notebook
//
//  Created by Egor Slobodskoy on 12.01.2022.
//

import UIKit


final class ActivityTableViewCell: UITableViewCell {
    
    enum Constants {
        static let cellHeight = 100.0
    }
    
    private let containerView = UIView()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        return label
    }()
    
    var avatarImageView: UIImageView = UIImageView(image: UIImage(named: "EmptyAvatar"))
    
    
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
        contentView.frame.size.height = CGFloat(Constants.cellHeight)
        
        setupLabels()
        setupAvatar()
    }
    
    private func setupAvatar() {
        containerView.addSubview(avatarImageView)
        
        avatarImageView.frame.size = CGSize(width: Constants.cellHeight * 0.7, height: Constants.cellHeight * 0.7)
        avatarImageView.center.y = contentView.center.y


        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.clipsToBounds = true
    }
    
    private func setupLabels() {
        containerView.addSubview(nameLabel)
    }
    
    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        ])

        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

    }

}

