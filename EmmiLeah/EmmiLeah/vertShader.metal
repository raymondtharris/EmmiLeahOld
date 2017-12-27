//
//  vertShader.metal
//  EmmiLeah
//
//  Created by Tim Harris on 12/26/17.
//  Copyright © 2017 Tim Harris. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 vertShader(const device packed_float3* blip [[ buffer(0)]], unsigned int vertexID [[ vertex_id]]) {
    return float4(blip[vertexID],1.0);
}
