//
//  Octalye.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/22/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import Foundation

class Octalye: CustomStringConvertible {
    var name: String = ""
    var vibe: Int
    var dissonance: Int
    var tamber: Int
    var syncopation: Int
    var description: String {
        return "\(self.name)"
    }
    init() {
        vibe = 5
        dissonance = 5
        tamber = 5
        syncopation = 5
        
    }
    
    init(stats:Dictionary<String, Any>) {
        name = stats["name"] as! String
        vibe = stats["vibe"] as! Int
        dissonance = stats["dissonance"] as! Int
        tamber = stats["tamber"] as! Int
        syncopation = stats["syncopation"] as! Int
    }
    
    
}


