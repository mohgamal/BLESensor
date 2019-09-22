//
//  BLECentral.swift
//  BLESensor
//
//  Created by Mohammed Abd El-Aty on 9/22/19.
//  Copyright © 2019 Mohammed Abd El-Aty. All rights reserved.
//

import Foundation
import CoreBluetooth

class BLECentral: NSObject, CBCentralManagerDelegate {

    var manager: CBCentralManager!
    var discoveredPeripherals = [DiscoveredPeripheral]()
    var onDiscovered: (()-> Void)?
    
    override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func scanForPeriphirlas(){
        let options: [String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey: false]
        manager.scanForPeripherals(withServices: nil, options: options)
        
    }
    
    //MARK: - CBCetntalManagerDelegate
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn{
            scanForPeriphirlas()
        }else{
            print("Central ins unavailable \(central.state.rawValue)")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let existingPeripheral = discoveredPeripherals.first(where : {$0.peripherl == peripheral}){
            existingPeripheral.advertismentData = advertisementData
            existingPeripheral.rssi = RSSI
        }else{
            discoveredPeripherals.append(DiscoveredPeripheral(peripherl: peripheral, rssi: RSSI, advertismentData: advertisementData))
            
        }
       
        onDiscovered?()
    }
}
