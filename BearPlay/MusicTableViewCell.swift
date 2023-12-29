//
//  MusicTableViewCell.swift
//  BearPlay
//
//  Created by 루딘 on 12/9/23.
//

import UIKit

class MusicTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var albumImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        if selected {
            albumImg.alpha = 1
        } else {
            albumImg.alpha = 0
        }
    }

}
