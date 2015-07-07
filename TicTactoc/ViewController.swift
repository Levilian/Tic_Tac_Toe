//
//  ViewController.swift
//  TicTactoe
//
//  Created by Jack&Levi on 7/2/15.
//  Copyright © 2015 Levi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var boardView: UIView!
    
    @IBOutlet var labelCollection: [UILabel]!
    
    @IBOutlet var resetBtn: UIButton!
    
    @IBOutlet weak var Pikachu,Uxie: UISegmentedControl!
    
    
    let waysToWin = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var board: [String] = []
    
    var currentTurn = "Pikachu.png"
    
    
    var done = false
    
    var aiDeciding = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeGame()
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        for label in labelCollection {
            if(label.text == "" && CGRectContainsPoint(label.frame, sender.locationInView(boardView))) {
                if(label.backgroundColor == nil){
                    print(String(label.tag) + " was tapped")
                    board[label.tag] = currentTurn
                    label.backgroundColor = UIColor(patternImage: UIImage(named: "\(currentTurn)")!)
                    
                    if let winner = checkForWin() {
                        presentAlert(winner + " has won the game")
                    }
                    
                    if checkForCatsGame() {
                        presentAlert("It's a draw")
                    }
                    
                    
                    
                    if(currentTurn == "Pikachu.png") {
                        currentTurn = "Uxie.png"
                    } else {
                        currentTurn = "Pikachu.png"
                    }
                }
            }
        }
    }
    
    func presentAlert(winner:String) {
        let alert = UIAlertController(title: winner,
            message: nil,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let alertAction = UIAlertAction(title: "Reset",
            style: UIAlertActionStyle.Default) {
                (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        presentViewController(alert, animated: true,
            completion: nil)
    }
    
    func resetBtnClicked(sender:UIButton) {
        done = false
        resetBtn.hidden = true
        resetGame()
    }
    
    func resetGame() {
        initializeGame()
        
        for label in labelCollection {
            label.backgroundColor = nil
        }
        currentTurn = "Pikachu.png"
        
        
    }
    
    func initializeGame() {
        board = []
        for num in 1...9 {
            board.append("")
        }
    }
    
    func checkForWin() -> String? {
        for way in waysToWin {
            if board[way[0]] == board[way[1]] && board[way[0]] != "" {
                if board[way[2]] == board[way[1]] {
                    return board[way[0]]
                    
                }
                
            }
        }
        resetBtn.hidden = false
        done = true
        return nil
        
    }
    
    func checkForCatsGame() -> Bool {
        for piece in board {
            if piece == "" {
                return false
            }
        }
        return true
    }
    
}

