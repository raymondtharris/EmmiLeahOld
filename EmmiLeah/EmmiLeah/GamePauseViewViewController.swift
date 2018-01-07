//
//  GamePauseViewViewController.swift
//  EmmiLeah
//
//  Created by Tim Harris on 1/6/18.
//  Copyright © 2018 Tim Harris. All rights reserved.
//

import UIKit

class GamePauseViewController: UIViewController {
    
    @IBOutlet weak var GamePauseContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GamePauseContainerView.layer.borderColor = UIColor.lightGray.cgColor
        GamePauseContainerView.layer.borderWidth = 2.0
        GamePauseContainerView.layer.cornerRadius = 5.0
        GamePauseContainerView.layer.masksToBounds = false
    }
}
