//
//  SelectionViewController.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/23/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    var player = EmmiLeahPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GamePlaySegue" {
            let destination = segue.destination as! GamePlayViewController
            player.currentOctalye = player.OctalyeAvaiable[0]
            destination.player = player
        }
    }
    
    @IBAction func goBackToTitleScreenViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
}
