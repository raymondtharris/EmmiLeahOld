//
//  TitleScreenViewController.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/23/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import UIKit

class TitleScreenViewController: UIViewController {
    
    @IBOutlet weak var GameTitleLabel: UILabel!
    @IBOutlet weak var ArcadeButton: UIButton!
    @IBOutlet weak var ShopButton: UIButton!
    @IBOutlet weak var SettingsButton: UIButton!
    
    
    var player:EmmiLeahPlayer = EmmiLeahPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSelectionSegue" {
            let destination = segue.destination as! SelectionViewController
            destination.player = player
        }
    }
    
}
