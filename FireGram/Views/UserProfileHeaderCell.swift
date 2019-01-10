//
//  UserProfileHeaderCell.swift
//  FireGram
//
//  Created by Kyle Thompson on 12/30/18.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import UIKit

class UserProfileHeaderCell: BaseCell {
    
    public var user: User? {
        didSet {
            guard let user = user else { return }
            
            self.usernameLabel.text = user.username
            profileImageView.loadImage(usingUrlString: user.profileImageUrl)
        }
    }
    
    public lazy var headerToolbarStackView: UIStackView = { [unowned self] in
        let view = UIStackView(arrangedSubviews: [
            self.gridButton,
            self.listButton,
            self.bookmarkButton
        ])
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public lazy var headerStatsStackView: UIStackView = { [unowned self] in
        let view = UIStackView(arrangedSubviews: [
            self.postsLabel,
            self.followersLabel,
            self.followingLabel
        ])
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var postsLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.attributedText = self.getAttributedString(forStatType: "posts", count: 1299)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    
    lazy var followersLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.attributedText = self.getAttributedString(forStatType: "followers", count: 2301)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    
    lazy var followingLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.attributedText = self.getAttributedString(forStatType: "followers", count: 2301)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    
    public let profileImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 40
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let gridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ic_grid_on_36pt"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let listButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ic_list_36pt"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(white: 0, alpha: 0.3)
        return button
    }()
    
    public let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ic_bookmark_border_36pt"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(white: 0, alpha: 0.3)
        return button
    }()
    
    public let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let topToolbarDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let bottomToolbarDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setup() {
        super.setup()
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
    
    private func setupView() {
        
    }
    
    private func setupSubViews() {
        addSubview(profileImageView)
        addSubview(headerStatsStackView)
        addSubview(editProfileButton)
        addSubview(usernameLabel)
        addSubview(topToolbarDivider)
        addSubview(headerToolbarStackView)
        addSubview(bottomToolbarDivider)
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            profileImageView.widthAnchor.constraint(equalToConstant: 80),
            profileImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 12),
//            usernameLabel.bottomAnchor.constraint(equalTo: headerToolbarStackView.topAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 0),
            usernameLabel.widthAnchor.constraint(equalToConstant: 100),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            headerStatsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            headerStatsStackView.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 12),
            headerStatsStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            headerStatsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            editProfileButton.topAnchor.constraint(equalTo: headerStatsStackView.bottomAnchor, constant: 4),
            editProfileButton.leadingAnchor.constraint(equalTo: headerStatsStackView.leadingAnchor, constant: 0),
            editProfileButton.trailingAnchor.constraint(equalTo: headerStatsStackView.trailingAnchor, constant: 0),
            editProfileButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            headerToolbarStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            headerToolbarStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            headerToolbarStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            headerToolbarStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            topToolbarDivider.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            topToolbarDivider.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            topToolbarDivider.topAnchor.constraint(equalTo: headerToolbarStackView.topAnchor, constant: 0),
            topToolbarDivider.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            bottomToolbarDivider.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            bottomToolbarDivider.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            bottomToolbarDivider.bottomAnchor.constraint(equalTo: headerToolbarStackView.bottomAnchor, constant: 0),
            bottomToolbarDivider.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
    }
    
    private func getAttributedString(forStatType type: String, count: Int) -> NSMutableAttributedString {
        let text = NSMutableAttributedString(
            string: "\(count)\n",
            attributes: [
                NSAttributedString.Key.foregroundColor : UIColor.black,
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
            ])
        
        let labelText = NSAttributedString(
            string: "\(type)",
            attributes: [
                NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            ])
        
        text.append(labelText)
        
        return text
    }
}
