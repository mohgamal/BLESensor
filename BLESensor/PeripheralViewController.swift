//
//  PeripheralViewController.swift
//  BLESensor
//
//  Created by Mohammed Abd El-Aty on 9/22/19.
//  Copyright © 2019 Mohammed Abd El-Aty. All rights reserved.
//

import UIKit

class PeripheralViewController: UIViewController {

    var peripheral: BLEPeripheral!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       peripheral = BLEPeripheral()
    }
    

 

}
