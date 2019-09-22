//
//  AppFlowController.swift
//  BLESensor
//
//  Created by Mohammed Abd El-Aty on 9/22/19.
//  Copyright © 2019 Mohammed Abd El-Aty. All rights reserved.
//

import UIKit

class AppFLowController{
    let window: UIWindow
    var central: BLECentral?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        //central = BLECentral()
        
        let viewController = PeripheralViewController()
        //viewController.central = central
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        
    }
}
