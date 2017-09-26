//
//  ViewController.swift
//  GyroScrope
//
//  Created by Denis Golub on 25/09/2017.
//  Copyright © 2017 Denis Golub. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool)
    {
        motionManager.gyroUpdateInterval = 0.2;
        
        motionManager.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                print (myData.rotationRate)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

