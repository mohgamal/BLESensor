//
//  DiscoveredPeripheral.swift
//  BLESensor
//
//  Created by Mohammed Abd El-Aty on 9/22/19.
//  Copyright © 2019 Mohammed Abd El-Aty. All rights reserved.
//

import Foundation
import CoreBluetooth

class DiscoveredPeripheral{
    
    var peripherl: CBPeripheral
    var rssi: NSNumber
    var advertismentData: [String:Any]
    
    init(peripherl: CBPeripheral, rssi : NSNumber, advertismentData: [String:Any]) {
        self.peripherl = peripherl
        self.rssi = rssi
        self.advertismentData = advertismentData
    }
}
