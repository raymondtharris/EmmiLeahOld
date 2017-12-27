//
//  Ovrei.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/22/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import Foundation

class Ovrei: CustomStringConvertible {
    var name:String = ""
    var currentKarh: Int
    var maxKarh:Int
    var description: String {
        return "\(self.name)"
    }
    init() {
        currentKarh = 20
        maxKarh = 20
    }
    init(stats: Dictionary<String, Any>) {
        name = stats["name"] as! String
        currentKarh = 20
        maxKarh = 20
    }
}


class OvreiPoke: CustomStringConvertible {
    var position = ""
    var timestamp = ""
    var description: String {
        return "\(self.position) \(self.timestamp)"
    }
    
}
