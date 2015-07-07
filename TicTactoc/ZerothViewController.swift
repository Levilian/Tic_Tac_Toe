//
//  ZerothViewController.swift
//  TicTactoc
//
//  Created by  on 7/3/15.
//  Copyright © 2015 Levi. All rights reserved.
//

import UIKit

class ZerothViewController: UIViewController {

    @IBOutlet var turnControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func turnControl(sender: AnyObject) {
        
        let turn = ["Pikachu.png", "Uxie.png"]
        let currentTurn = turn[turnControl.selectedSegmentIndex]
    }
   
}
 