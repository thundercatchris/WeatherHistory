//
//  LocationTableViewCell.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var location:Location?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell() {
        if let location = location {
            nameLabel.text = location.name
        }
    }
    
    override func prepareForReuse() {
        location = nil
        nameLabel.text = ""
    }

}
