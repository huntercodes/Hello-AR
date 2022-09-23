//
//  ContentView.swift
//  Hello AR
//
//  Created by hunter downey on 9/23/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let anchor = AnchorEntity(plane: .horizontal)
        
        let boxMaterial = SimpleMaterial(
            color: .systemBlue,
            isMetallic: true
        )
        let sphereMaterial = SimpleMaterial(
            color: .systemGreen,
            isMetallic: true
        )
        let planeMaterial = SimpleMaterial(
            color: .systemRed,
            isMetallic: true
        )
        
        let box = ModelEntity(
            mesh: .generateBox(size: 0.17),
            materials: [boxMaterial]
        )
        
        let sphere = ModelEntity(
            mesh: .generateSphere(radius: 0.17),
            materials: [sphereMaterial]
        )
        sphere.position = simd_make_float3(0, 0.27, 0)
        
        let plane = ModelEntity(
            mesh: .generatePlane(width: 0.47, depth: 0.27),
            materials: [planeMaterial]
        )
        plane.position = simd_make_float3(0, 0.44, 0)
        
        anchor.addChild(box)
        anchor.addChild(sphere)
        anchor.addChild(plane)
        arView.scene.anchors.append(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
