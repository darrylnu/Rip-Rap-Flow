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
    
    var numberOfMovesMade = 0
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playerOneScore: UILabel!
    
    @IBOutlet var winnerPic: UIImageView!
    
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
            numberOfMovesMade++
            gameOverCheck()
            
        } else if currentPlayer == 2 && gameState[sender.tag] == 0 && gameActive {
            
            sender.setImage(UIImage(named:"meek.png"), forState: .Normal)
            gameState[sender.tag] = currentPlayer
            currentPlayer = 1
            numberOfMovesMade++
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
                    print("player 1 win")
                    playerWin("Player 1")
                } else {
                    player2Score++
                    playerTwoScore.text = String(player2Score)
                    print("player 2 win")
                    playerWin("Player 2")
                }
                
                
            }
        }
        
        if gameActive && numberOfMovesMade == 9{
            
            print("game is a tie")
            
            restartGameButton.hidden = false
            
            gameActive = false
            
            
            
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
        
        numberOfMovesMade = 0
        
        restartGameButton.hidden = true
        
        winnerLabel.hidden = true
        winnerLabel.center = CGPointMake(winnerLabel.center.x + 500, winnerLabel.center.y)
        
        winnerPic.hidden = true
        winnerPic.center = CGPointMake(winnerPic.center.x, winnerPic.center.y + 500)
        
        
        
        
        
    }
    
    func playerWin (sender: String) {
        winnerLabel.hidden = false
        winnerPic.hidden = false
        
        winnerLabel.text = "\(sender) wins!  "
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.winnerLabel.center = CGPointMake(self.winnerLabel.center.x - 500, self.winnerLabel.center.y)
            
            self.winnerPic.center = CGPointMake(self.winnerPic.center.x, self.winnerPic.center.y-500)
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        restartGameButton.hidden = true
        
        winnerLabel.hidden = true
        winnerLabel.center = CGPointMake(winnerLabel.center.x + 500, winnerLabel.center.y)
        
        winnerPic.hidden = true
        winnerPic.center = CGPointMake(winnerPic.center.x, winnerPic.center.y + 500)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

