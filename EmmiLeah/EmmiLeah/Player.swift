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
    var player: GKCloudPlayer = GKCloudPlayer()
    var playerVia: Int
    var currentOvrei: Ovrei
    var OvreiAvailable: Array<Ovrei> = loadOvrei()!
    var currentOctalye: Octalye
    var OctalyeAvaiable: Array<Octalye> = loadOctalye(option: "Available")!
    
    init() {
        playerVia = 0
        currentOvrei = Ovrei()
        currentOctalye = Octalye()
    }
}

func loadOctalye(option:String) -> Array<Octalye>? {
    var array: Array<Octalye> = []
    if let filePath = Bundle.main.path(forResource: "OctalyeTypes", ofType: "plist") {
        let data = NSArray.init(contentsOfFile: filePath) as! [[String:AnyObject]]
        for anOctalyeDict:Dictionary in data {
            if option == "All"{
                 array.append(Octalye(stats: anOctalyeDict))
            } else if option == "Available" {
                if anOctalyeDict["available"] as! Bool == true {
                    array.append(Octalye(stats: anOctalyeDict))
                }
            } else {
                if anOctalyeDict["available"] as! Bool == false {
                    array.append(Octalye(stats: anOctalyeDict))
                }
            }
           
        }
        return array
    }
    return nil
}

func loadOvrei() -> Array<Ovrei>? {
    var array: Array<Ovrei> = []
    if let filePath = Bundle.main.path(forResource: "OvreiTypes", ofType: "plist") {
        let data = NSArray.init(contentsOfFile: filePath) as! [[String:AnyObject]]
        for anOvreiDict:Dictionary in data {
            array.append(Ovrei(stats: anOvreiDict))
        }
        return array
    }
    return nil
}
