//
//  TweetTableViewCell.swift
//  FacebookClone
//
//  Created by Jackson Cuevas on 1/8/24.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
    }

    func setupCell(username: String, message: String) {
        usernameLabel.text = username
        messageLabel.text = message
    }
}
