//
//  TitleScreenViewController.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/23/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import UIKit
import MetalKit

enum Colors {
    static let clearCol = MTLClearColor(red: 0.0, green: 0.0, blue: 0.21, alpha: 1.0)
}

class TitleScreenViewController: UIViewController {
    
    @IBOutlet weak var GameTitleLabel: UILabel!
    @IBOutlet weak var ArcadeButton: UIButton!
    @IBOutlet weak var ShopButton: UIButton!
    @IBOutlet weak var SettingsButton: UIButton!
    
    let tapGesture = UITapGestureRecognizer()
    
    
    var titleScreenView: MTKView {
        return view as! MTKView
    }
    
    var renderer:TranscendenceRenderer!

    var player:EmmiLeahPlayer = EmmiLeahPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tapGesture.addTarget(self, action: #selector (self.pokeOvrei(_:) ))
        titleScreenView.addGestureRecognizer(tapGesture)
        tapGesture.delegate = renderer
        titleScreenView.device = MTLCreateSystemDefaultDevice()
        renderer = TranscendenceRenderer(aDevice: titleScreenView.device!)
        titleScreenView.clearColor = Colors.clearCol
        titleScreenView.delegate = renderer
        renderer.commandQueue  = renderer.device.makeCommandQueue()
        
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
    
    @objc func pokeOvrei(_ sender:UITapGestureRecognizer) {
        let location = sender.location(in: titleScreenView)
        let poke = OvreiPoke(aPosition: location)
        renderer.taps.append(poke)
        renderer.aTap = location
        //print("poke at: \(poke)")
    }
    
}


