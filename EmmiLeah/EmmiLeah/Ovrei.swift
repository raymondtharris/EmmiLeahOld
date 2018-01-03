//
//  Ovrei.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/22/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import UIKit
import ModelIO

class Ovrei: CustomStringConvertible {
    var name:String = ""
    var currentKarh: Int
    var maxKarh:Int
    var description: String {
        return "\(self.name)"
    }
    var model: MDLAsset!
    var postion: [Float] = [0,0,0]
    var vertexData:[Float] = [ -0.25,0.25,0,
                       -0.25,-0.25,0,
                       0.25,-0.25,0,
                       0.25,0.25,0,
                       -0.25,0.25,0,
                       0.25,-0.25,0.0]
    
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
    var position: CGPoint
    var timestamp: Date
    var description: String {
        return "\(self.position) \(self.timestamp)"
    }
    
    init(aPosition: CGPoint) {
        position = aPosition
        timestamp = Date()
    }

}


func normalizeTap(aPos: CGPoint, aView: UIView ) -> CGPoint {
    //print("point:\(aPos)  viewHeight:\(aView.frame.height/2)")
    var newX:CGFloat = 0.0
    var newY:CGFloat = 0.0
    let halfHeight = aView.frame.height/2
    if aPos.y > halfHeight {
        let negHeight = aPos.y - halfHeight
        newY = -(negHeight/halfHeight)
    } else {
        let posHeight = halfHeight - aPos.y
        newY = (posHeight/halfHeight)
    }
    let halfWidth = aView.frame.width/2
    if aPos.x < halfWidth {
        let negWidth = halfWidth - aPos.x
        newX = -(negWidth/halfWidth)
    } else {
        let posWidth = aPos.x - halfWidth
        newX = (posWidth/halfWidth)
    }
    //print("x:\(newX) y:\(newY)")
    return CGPoint(x: newX, y: newY)
}
