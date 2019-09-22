//
//  DiscoveryViewController.swift
//  BLESensor
//
//  Created by Mohammed Abd El-Aty on 9/22/19.
//  Copyright © 2019 Mohammed Abd El-Aty. All rights reserved.
//

import UIKit
import CoreBluetooth

class DiscoveryViewController: UITableViewController {

    var central : BLECentral!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        central.onDiscovered = { [weak self] in
            self?.tableView.reloadData()
        }
        
        tableView.register(UINib(nibName: "DiscoveredPeripheralCell", bundle: nil), forCellReuseIdentifier: "DiscoveredPeripheralCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return central.discoveredPeripherals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoveredPeripheralCell", for: indexPath) as! DiscoveredPeripheralCell
        let discoveredPeripheral = central.discoveredPeripherals[indexPath.row]
        cell.identifierLabel.text = discoveredPeripheral.peripherl.identifier.uuidString
        cell.rssiLabel.text = "\(discoveredPeripheral.rssi.stringValue), \(discoveredPeripheral.peripherl.name ?? "")"
        cell.advertismentLabel.text = discoveredPeripheral.advertismentData.debugDescription
        cell.identifierLabel.textColor = .blue
        cell.rssiLabel.textColor = .red
        return cell
    }
    

    
}
