//
//  Button.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/30/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: 200, height: frame.height)))
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: 168, height: frame.height)
    }
}
