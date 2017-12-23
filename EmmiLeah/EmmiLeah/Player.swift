//
//  Player.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/22/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import Foundation
import GameKit

class EmmiLeahPlayer {
    var playerName: String
    var playerVia: Int
    var currentOvrei: Ovrei
    var OvreiAvailable: Array<Ovrei> = []
    var currentOctalye: Octalye
    var OctalyeAvaiable: Array<Octalye> = []
    
    init() {
        playerName = "New Player"
        playerVia = 0
        currentOvrei = Ovrei()
        currentOctalye = Octalye()
    }
}
