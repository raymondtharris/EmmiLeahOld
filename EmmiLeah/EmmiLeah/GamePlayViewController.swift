//
//  GamePlayViewController.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/23/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import Foundation
import UIKit
import GameplayKit
import MetalKit

class GamePlayViewController: UIViewController {
    var player:EmmiLeahPlayer = EmmiLeahPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("\(player.currentOctalye)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PauseMenuSegues" {
            
        }
    }
}
