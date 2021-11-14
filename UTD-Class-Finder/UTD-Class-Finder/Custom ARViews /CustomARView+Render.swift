//
//  CustomARView+Render.swift
//  UTD Class Finder
//
//  Created by Shoaib Huq on 11/13/21.
//

import Foundation
import RealityKit
import ARKit

extension CustomARView {
    
    
    func rotationMultiplier() -> simd_quatf {
        switch arState.arrowRotation {
        case .forward:
            return simd_quatf(angle:.pi, axis: SIMD3<Float>(1, 0, 0))
        default:
            return simd_quatf(angle:.pi, axis: SIMD3<Float>(1, 0, 0))
        }
    }
    
    func addAnchorEntityToScene(anchor: ARAnchor) {
    
        guard let anchorName = anchor.name, anchorName.starts(with: virtualObjectAnchorName) else {
//            print("DEBUG: anchor.name is not == virtualObjectAnchorName")
//            print("DEBUG: anchorName = \(anchor.name)")
            return
        }
        // save the reference to the virtual object anchor when the anchor is added from relocalizing
        if virtualObjectAnchor == nil {
            virtualObjectAnchor = anchor
        }
        
//        virtualObject.modelEntity?.transform.rotation *= simd_quatf(angle: .pi * 0.5, axis: SIMD3<Float>(1,0,0))
        
//        var newVirtualObject = virtualObject.modelEntity?.clone(recursive: true)
        if let modelEntity = virtualObject.modelEntity?.clone(recursive: true) {
//            modelEntity.transform.rotation
            print ("DEBUG: loadKeyIndex = \(self.loadKeyIndex)")
            print("DEBUG: numExperiences in ARView: \(self.numExperiences)")

            if (self.doneSaving && self.loadKeyIndex < self.numExperiences){
                self.loadExperience()
                print("DEBUG: adding model to load scene - \(modelEntity.name)")
            }
            else{
                print("DEBUG: adding model to save scene - \(modelEntity.name)")
            }

            // Add modelEntity and anchorEntity into the scene for rendering
            let anchorEntity = AnchorEntity(anchor: anchor)
            anchorEntity.addChild(modelEntity)
            self.scene.addAnchor(anchorEntity)
        } else {
        
        
        
//        if let modelEntity = virtualObject.modelEntity {
//            print ("DEBUG: loadKeyIndex = \(self.loadKeyIndex)")
//            print("DEBUG: numExperiences in ARView: \(self.numExperiences)")
//
//            if (self.doneSaving && self.loadKeyIndex < self.numExperiences){
//                self.loadExperience()
//                print("DEBUG: adding model to load scene - \(virtualObject.name)")
//            }
//            else{
//                print("DEBUG: adding model to save scene - \(virtualObject.name)")
//
//            }
//
//            // Add modelEntity and anchorEntity into the scene for rendering
//            let anchorEntity = AnchorEntity(anchor: anchor)
//            anchorEntity.addChild(modelEntity)
//            self.scene.addAnchor(anchorEntity)
//        } else {
        
        
            print("DEBUG: Unable to load modelEntity for \(virtualObject.name)")
        }
    }
    
}
