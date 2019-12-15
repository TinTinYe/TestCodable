//
//  SongTableViewCell.swift
//  TestCodable
//
//  Created by Yvonne on 2019/12/11.
//  Copyright © 2019 Yvonne. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        layer.allowsEdgeAntialiasing = true
        layer.cornerRadius = 30
        layer.borderWidth = 2
        layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        // Configure the view for the selected state
    }

}
