//
//  SingleViewController.swift
//  TicTactoc
//
//  Created by Levi on 7/7/15.
//  Copyright © 2015 Levi. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    @IBOutlet var labelCollection: [UILabel]!
    
    @IBOutlet weak var boardView: UIView!
    
    @IBOutlet var resetBtn: UIButton? = nil
    
    @IBOutlet var userMessage : UILabel? = nil
    
    var plays = Dictionary<Int, Int>()
    var done = false
    var aiDeciding = false
    
    @IBAction func UIButtionClicked(sender:UIButton) {
        userMessage!.hidden = true
        if !plays[sender.tag] && !aiDeciding && !done {
            setImageForSpot(sender.tag, player:1)
        }
}
    
        checkForWin()
        aiTurn() {
            if done {
                return
            }
            
            aiDeciding = true
            if let result = rowCheck(value:0) {
                
            }
            aiDeciding = false
        }
        
    

    func setImageForSpot(spot:Int,player:Int) {
        var playerMark = player == 1 ? "Pikachu" : "Uxie"
        plays[spot] = player
        switch spot {
        case 1:
            
            
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()



}

}