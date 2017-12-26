//
//  Transcendence.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/23/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import Foundation
import MetalKit

class TranscendenceRenderer {
    var commandQueue: MTLCommandQueue!
    var commandEncoder: MTLCommandEncoder!
    var commandBuffer: MTLCommandBuffer!
    var transcendenceView: MTKView!
    var device: MTLDevice!
    
    init(aDevice: MTLDevice) {
        device = aDevice
        commandQueue = aDevice.makeCommandQueue()
    }
    
    func render(aView: MTKView) {
        guard let drawable = aView.currentDrawable, let descriptor = aView.currentRenderPassDescriptor else { return  }
        
        commandBuffer = commandQueue.makeCommandBuffer()
        commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor)
        commandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
}


