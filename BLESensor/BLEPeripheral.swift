//
//  BLEPeripheral.swift
//  BLESensor
//
//  Created by Mohammed Abd El-Aty on 9/22/19.
//  Copyright © 2019 Mohammed Abd El-Aty. All rights reserved.
//

import Foundation
import CoreBluetooth


class BLEPeripheral: NSObject ,CBPeripheralManagerDelegate{
  
    
    private var manager: CBPeripheralManager!
    private var characteristic: CBMutableCharacteristic!
    
    override init() {
        super.init()
        manager = CBPeripheralManager.init(delegate: self, queue: nil)
    }
    
    func setup (){
        let characteristicUUID = CBUUID(string: BLEIdentifiers.charachteristicsIdentifier)
        characteristic = CBMutableCharacteristic(type: characteristicUUID, properties: [.read], value: nil, permissions: [.readable])
        
        let descriptor = CBMutableDescriptor(type: CBUUID(string: CBUUIDCharacteristicUserDescriptionString), value: "BLE Sensor prototype")
        characteristic.descriptors = [descriptor]
        
        let service = CBMutableService(type: CBUUID(string: BLEIdentifiers.serviceIdentifier), primary: true)
        
        service.characteristics = [characteristic]
        
        manager.add(service)
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        
        if peripheral.state == .poweredOn{
            setup()
        }else{
            print("peripheral ins not avaiable \(peripheral.state.rawValue)")
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        if let error = error{
            print("could not add service \(error.localizedDescription)")
        }else{
            print("peripheral added service : Start advertising")
            
            let advertisementData : [String: Any] = [
                CBAdvertisementDataServiceUUIDsKey: [CBUUID(string: BLEIdentifiers.serviceIdentifier)],
                CBAdvertisementDataLocalNameKey: "BLE Sensor"
            ]
            
            manager.startAdvertising(advertisementData)
        }
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error{
            print("Could not advertising \(error.localizedDescription)")
        }else{
            print("peripheral start advertising")
        }
    }
}
