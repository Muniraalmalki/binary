//
//  ViewController.swift
//  binary
//
//  Created by munira almallki on 01/03/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var total : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalLabel.text = "Total:\(total)"
       
        tableView.dataSource = self
    }
}

extension ViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 16
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let currentPower = pow(10, indexPath.row)
        let currentPowerInt = (currentPower as NSDecimalNumber).intValue
        cell.power = currentPowerInt
        cell.delegate = self
        cell.numberLabel.text = "\(currentPower)"
        return cell
    }
}

extension ViewController:CustomCellDelegate{
    func add(amount: Int) {
        self.total += amount
        totalLabel.text = "Total:\(total)"
    }
    
    func sub(amount: Int) {
        self.total -= amount
        totalLabel.text = "Total:\(total)"
    }
}
