//
//  Octalye.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/22/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import Foundation

class Octalye {
    var name: String = ""
    var flow: Int
    var vibe: Int
    var dissonance: Int
    var tamber: Int
    var syncopation: Int
    
    init() {
        vibe = 5
        dissonance = 5
        tamber = 5
        syncopation = 5
        flow  = 20
        
    }
    
    init(anOvrei: Ovrei, stats:Dictionary<String, Any>) {
        name = stats["name"] as! String
        vibe = stats["vibe"] as! Int
        dissonance = stats["dissonance"] as! Int
        tamber = stats["tamber"] as! Int
        syncopation = stats["syncopation"] as! Int
        flow  = calculateFlow(anOvre: anOvrei)
    }
    
    
}


func calculateFlow(anOvre:Ovrei) -> Int {
    return 20
}
