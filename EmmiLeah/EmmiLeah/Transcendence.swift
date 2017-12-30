//
//  Transcendence.swift
//  EmmiLeah
//
//  Created by Tim Harris on 12/23/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

import Foundation
import MetalKit

class TranscendenceRenderer: NSObject {
    var commandQueue: MTLCommandQueue!
    var commandEncoder: MTLRenderCommandEncoder!
    var commandBuffer: MTLCommandBuffer!
    var pipelineState: MTLRenderPipelineState!
    var vertexBuffer: MTLBuffer!
    var vertexBuffer2: MTLBuffer!
    
    var device: MTLDevice!
    
    var taps: Array<OvreiPoke> = []
    var aTap: CGPoint!
    var anOvrei:Ovrei!

    
    init(aDevice: MTLDevice) {
        device = aDevice
        commandQueue = aDevice.makeCommandQueue()
        super.init()
        anOvrei = Ovrei()
        buildBlip()
        buildPipeline()
    }
    var vertexData:[Float] = [ -0.25,0.25,0,
                               -0.25,-0.25,0,
                               0.25,-0.25,0,
                               0.25,0.25,0,
                               -0.25,0.25,0,
                               0.25,-0.25,0.0]
    var vertexData2:[Float] = [0.0, 0.0, 0.0]
    
    
    private func buildBlip() {
        vertexBuffer = device.makeBuffer(bytes: vertexData, length: vertexData.count * MemoryLayout<Float>.size, options: [])!
        vertexBuffer2 = device.makeBuffer(bytes: vertexData2, length: vertexData2.count * MemoryLayout<Float>.size, options: [])!
    }
    private func buildPipeline()  {
        let defaultLib = self.device.makeDefaultLibrary()
        let vertexProgram = defaultLib?.makeFunction(name: "vertShader")
        let fragmentProgram = defaultLib?.makeFunction(name: "fragShader")
        
        
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        } catch let error {
            print("Error: \(error) ")
        }
    }
    
    func render(aView: MTKView) {
        guard let drawable = aView.currentDrawable,let pipelineState = pipelineState, let descriptor = aView.currentRenderPassDescriptor else { return  }
        
        if (aTap) != nil {
           // print("\(aTap)")
            let normalized = normalizeTap(aPos: aTap, aView: aView)
                vertexData2 = [Float(normalized.x), Float(normalized.y), 0.0]
            vertexBuffer2 = device.makeBuffer(bytes: vertexData2, length: vertexData2.count * MemoryLayout<Float>.size, options: [])!
        }

        commandBuffer = commandQueue.makeCommandBuffer()
        commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor)
        
        commandEncoder.setRenderPipelineState(pipelineState)
        commandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        commandEncoder.setVertexBuffer(vertexBuffer2, offset: 0, index: 1)
        commandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertexData.count)
        commandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
}

extension TranscendenceRenderer: UIGestureRecognizerDelegate {
   
}

extension TranscendenceRenderer: MTKViewDelegate {
    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    
    public func draw(in view: MTKView) {
        
        render(aView: view)
        
    }
    
}

