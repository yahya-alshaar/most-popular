//
//  MiniArticleTableViewCell.swift
//  PopularArticles
//
//  Created by Yahya Alshaar on 5/13/19.
//  Copyright © 2019 Yahya Alshaar. All rights reserved.
//

import UIKit

class MiniArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
