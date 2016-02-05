//
//  ViewController.swift
//  ExesAndOs
//
//  Created by Darryl Nunn on 2/4/16.
//  Copyright © 2016 Darryl Nunn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var winningCombinations = [[0,3,6],[1,4,7],[2,5,8],[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
    
    
    @IBOutlet var gamePiece: UIButton!
    
    
    @IBAction func placePiece(sender: AnyObject) {
        
        if currentPlayer == 1 && gameState[sender.tag] == 0 {
        
            sender.setImage(UIImage(named:"cross.png"), forState: .Normal)
            gameState[sender.tag] = currentPlayer
            currentPlayer = 2
            gameOverCheck()
            
        } else if currentPlayer == 2 && gameState[sender.tag] == 0 {
            
            sender.setImage(UIImage(named:"nought.png"), forState: .Normal)
            gameState[sender.tag] = currentPlayer
            currentPlayer = 1
            gameOverCheck()

        }
        print(gameState)
    }
    
    func gameOverCheck(){
        
        for combinations in winningCombinations {
            if gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] && gameState[combinations[0]] != 0 {
//                print("we have a winner")
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

