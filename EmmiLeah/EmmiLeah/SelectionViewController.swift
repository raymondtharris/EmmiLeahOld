//
//  SelectionViewController.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/23/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import UIKit
import MetalKit

class SelectionViewController: UIViewController {
    var player = EmmiLeahPlayer()
    var renderer:TranscendenceRenderer!
    
    @IBOutlet weak var OcatalyeSelectionLabel: UILabel!
    @IBOutlet weak var SelectionStartButton: UIButton!
    @IBOutlet weak var SelectionBackButton: UIButton!
    
    @IBOutlet weak var SelectionContainerVIew: UIView!
    
    var SelectionScreenView: MTKView {
        return view as! MTKView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SelectionScreenView.device = renderer.device
        SelectionScreenView.clearColor = Colors.clearCol
        SelectionScreenView.delegate = renderer
        //renderer.commandQueue  = renderer.device.makeCommandQueue()
        
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
