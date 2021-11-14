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
            return simd_quatf(angle: .ulpOfOne, axis: SIMD3<Float>(1, 0, 0))
        case .backward:
            return simd_quatf(angle: .pi, axis: SIMD3<Float>(1, 0, 0))
        case .left:
            return simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(0, 1, 0))
        case .right:
            return simd_quatf(angle: .pi * (3 / 2), axis: SIMD3<Float>(0, 1, 0))
        case .up:
            return simd_quatf(angle: .pi / 2, axis: SIMD3<Float>(1, 0, 0))
        }
    }
    
    func addAnchorEntityToScene(anchor: ARAnchor) {
    
        guard let anchorName = anchor.name else {

            return
        }
        // save the reference to the virtual object anchor when the anchor is added from relocalizing
        if virtualObjectAnchor == nil {
            virtualObjectAnchor = anchor
        }
        
        if arState.targetPlacement {
            print("DEBUG: inside targetPlacement")
            let modelEntity = self.targetObject.modelEntity!
//            let targetAnchor = try! Target.Scene.loadAnchor(named: "TemocTarget", in: Bundle.main)
            let anchorEntity = AnchorEntity(anchor: anchor)
            anchorEntity.addChild(modelEntity)
            self.scene.addAnchor(anchorEntity)
            
//            self.scene.addAnchor(targetAnchor)
            arState.targetPlacement = false
            return
        }
        
        if let modelEntity = virtualObject.modelEntity?.clone(recursive: true) {
            modelEntity.transform.rotation *= rotationMultiplier()
            print ("DEBUG: loadKeyIndex = \(self.loadKeyIndex)")
            print("DEBUG: numExperiences in ARView: \(self.numExperiences)")

//            if (self.doneSaving && self.loadKeyIndex < self.numExperiences){
//                self.loadExperience()
//                print("DEBUG: adding model to load scene - \(modelEntity.name)")
//            }
//            else{
//                print("DEBUG: adding model to save scene - \(modelEntity.name)")
//            }

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
