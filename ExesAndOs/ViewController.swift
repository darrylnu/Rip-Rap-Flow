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
    
    
    @IBOutlet var gamePiece: UIButton!
    
    
    @IBAction func placePiece(sender: AnyObject) {
        
        if currentPlayer == 1 && gameState[sender.tag] == 0 {
        
            sender.setImage(UIImage(named:"cross.png"), forState: .Normal)
            gameState[sender.tag] = currentPlayer
            currentPlayer = 2
            
        } else if currentPlayer == 2 && gameState[sender.tag] == 0 {
            
            sender.setImage(UIImage(named:"nought.png"), forState: .Normal)
            gameState[sender.tag] = currentPlayer
            currentPlayer = 1

        }
        print(gameState)
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

