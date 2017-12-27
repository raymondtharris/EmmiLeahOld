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
    var device: MTLDevice!
    
    
    var blip: [Float] = [ 0,0.5,0, 0,0,0, 0.5,0,0, 0.5,0.5,0, 0,0.5,0, 0.5,0.0]
    
    init(aDevice: MTLDevice) {
        device = aDevice
        commandQueue = aDevice.makeCommandQueue()
        super.init()
        buildBlip()
        buildPipeline()
    }
    
    private func buildBlip() {
        vertexBuffer = device.makeBuffer(bytes: blip, length: blip.count * MemoryLayout<Float>.size, options: [])
    }
    private func buildPipeline()  {
        let defaultLib = self.device.makeDefaultLibrary()
        let fragmentShader = defaultLib?.makeFunction(name: "fragShader")
        let vertexShader = defaultLib?.makeFunction(name: "vertShader")
        
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexShader
        pipelineStateDescriptor.fragmentFunction = fragmentShader
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
        } catch let error {
            print("Error: \(error) ")
        }
    }
    
    func render(aView: MTKView) {
        guard let drawable = aView.currentDrawable,let pipelineState = pipelineState, let descriptor = aView.currentRenderPassDescriptor else { return  }
        
        commandBuffer = commandQueue.makeCommandBuffer()
        commandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor)
        
        commandEncoder.setRenderPipelineState(pipelineState)
        commandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        commandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: blip.count)
        commandEncoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
}

extension TranscendenceRenderer: MTKViewDelegate {
    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    
    public func draw(in view: MTKView) {
        
        render(aView: view)
        
    }
    
}

