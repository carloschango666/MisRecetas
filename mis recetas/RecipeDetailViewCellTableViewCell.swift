//
//  RecipeDetailViewCellTableViewCell.swift
//  mis recetas
//
//  Created by carlos aguilar hernandez on 25/10/16.
//  Copyright © 2016 carlos aguilar hernandez. All rights reserved.
//

import UIKit

class RecipeDetailViewCellTableViewCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    
    @IBOutlet var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
