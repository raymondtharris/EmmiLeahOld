//
//  vertShader.metal
//  EmmiLeah
//
//  Created by Tim Harris on 12/26/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;



vertex float4 vertShader(const device packed_float3* blip [[ buffer(0)]],const device packed_float3* newPos [[ buffer(1)]],unsigned int vertexID [[ vertex_id]]) {
    float newX = blip[vertexID][0] + newPos[0][0];
    float newY = blip[vertexID][1] + newPos[0][1];
    float newZ = (blip[vertexID][2] + newPos[0][2]);
    float4 newPosition = float4(newX, newY, newZ, 1.0);
    return float4(newPosition);
    //return float4(blip[vertexID], 1.0);
}
