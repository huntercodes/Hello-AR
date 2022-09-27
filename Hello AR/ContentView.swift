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
        
        let text = ModelEntity(
            mesh: .generateText(
                "Hello AR",
                extrusionDepth: 0.03,
                font: .boldSystemFont(ofSize: 0.17),
                containerFrame: .zero,
                alignment: .center,
                lineBreakMode: .byCharWrapping
            ),
            materials: [SimpleMaterial(
                color: .systemTeal,
                isMetallic: true
            )]
        )
        
        anchor.addChild(text)
       
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
