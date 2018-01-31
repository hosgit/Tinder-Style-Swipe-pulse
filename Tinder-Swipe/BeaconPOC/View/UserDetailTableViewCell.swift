//
//  UserDetailTableViewCell.swift
//  BeaconPOC
//
//  Created by Hos on 29/01/18.
//  Copyright © 2018 lbox. All rights reserved.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
 
    @IBOutlet weak var typeLabel: UILabel!
 
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

}
