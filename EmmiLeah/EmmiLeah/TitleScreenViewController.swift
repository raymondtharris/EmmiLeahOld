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
    static let clearCol = MTLClearColor(red: 0.0, green: 0.4, blue: 0.21, alpha: 1.0)
}

class TitleScreenViewController: UIViewController {
    
    @IBOutlet weak var GameTitleLabel: UILabel!
    @IBOutlet weak var ArcadeButton: UIButton!
    @IBOutlet weak var ShopButton: UIButton!
    @IBOutlet weak var SettingsButton: UIButton!
    
    
    var titleScreenView: MTKView {
        return view as! MTKView
    }
    
    var renderer:TranscendenceRenderer!

    let device = MTLCreateSystemDefaultDevice()
    var player:EmmiLeahPlayer = EmmiLeahPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        titleScreenView.device = MTLCreateSystemDefaultDevice()
        renderer = TranscendenceRenderer(aDevice: titleScreenView.device!)
        titleScreenView.clearColor = Colors.clearCol
        titleScreenView.delegate = self
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
    
}

extension TitleScreenViewController: MTKViewDelegate {
    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    public func draw(in view: MTKView) {
        renderer.render(aView: view)
        
    }
    
}
