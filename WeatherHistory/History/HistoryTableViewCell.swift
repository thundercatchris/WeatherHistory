//
//  HistoryTableViewCell.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    var history:History!
    
    @IBOutlet weak var tmaxLabel: UILabel!
    @IBOutlet weak var tminLabel: UILabel!
    @IBOutlet weak var afDaysLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var sunLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell() {
        if let history = history {
            dateLabel.text = history.date
            tmaxLabel.text = history.tmax
            tminLabel.text = history.tmin
            afDaysLabel.text = history.afDays
            rainLabel.text = history.rain
            sunLabel.text = history.sun
        }
    }
    
    override func prepareForReuse() {
        history = nil
        //        nameLabel.text = ""
    }
    
}
