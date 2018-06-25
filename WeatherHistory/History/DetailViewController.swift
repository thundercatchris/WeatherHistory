//
//  DetailViewController.swift
//  WeatherHistory
//
//  Created by Cerebro on 25/06/2018.
//  Copyright © 2018 thundercatchris. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var location:Location!
    var history:[History]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var keyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        keyView.layer.borderColor = UIColor.lightGray.cgColor
        keyView.layer.borderWidth = 0.5
        
        title = location.name
        
        NetworkRequest().locationHistoryRequest(url: location.url) { (history) in
            self.history = history
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let history = history {
            return history.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryTableViewCell
        cell.prepareForReuse()
        if let hist = history?[indexPath.row] {
            cell.history = hist
        }
        cell.setupCell()
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
