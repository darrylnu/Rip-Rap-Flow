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
    
    var gameActive = true
    
    
    @IBOutlet var playerOneScore: UILabel!
    
    
    @IBOutlet var playerTwoScore: UILabel!
    
    var player1Score = 0
    
    var player2Score = 0
    
    @IBOutlet var restartGameButton: UIButton!
    
    @IBOutlet var gamePiece: UIButton!
    
    
    @IBAction func placePiece(sender: AnyObject) {
        
        if currentPlayer == 1 && gameState[sender.tag] == 0 && gameActive {
        
            sender.setImage(UIImage(named:"drake.png"), forState: .Normal)
            gameState[sender.tag] = currentPlayer
            currentPlayer = 2
            gameOverCheck()
            
        } else if currentPlayer == 2 && gameState[sender.tag] == 0 && gameActive {
            
            sender.setImage(UIImage(named:"meek.png"), forState: .Normal)
            gameState[sender.tag] = currentPlayer
            currentPlayer = 1
            gameOverCheck()

        }
        print(gameState)
    }
    
    func gameOverCheck(){
        
        for combinations in winningCombinations {
            if gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] && gameState[combinations[0]] != 0 {
                
                restartGameButton.hidden = false
                
                gameActive = false
                
                if currentPlayer-1 == 1 {
                    player1Score++
                    playerOneScore.text = String(player1Score)
                    
                    print("crosses win")
                } else {
                    player2Score++
                    playerTwoScore.text = String(player2Score)
                    print("noughts win")
                }
                
                
            }
        }
    }
    
    @IBAction func restartGame(sender:AnyObject){
        
        print("game restarted")
        
        gameActive = true
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        currentPlayer = 1
        
        restartGameButton.hidden = true
        
        
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        restartGameButton.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

