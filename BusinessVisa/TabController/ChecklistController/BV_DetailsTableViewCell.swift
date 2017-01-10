//
//  BV_DetailsTableViewCell.swift
//  BusinessVisa
//
//  Created by Sravan Kumar on 10/01/17.
//  Copyright © 2017 Gemini. All rights reserved.
//

import UIKit

class BV_DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var tickButton: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(cellData: NSDictionary) -> Void {
        titleLbl?.text = cellData.object(forKey: "itemName") as? String
    }
}
