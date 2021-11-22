//
//  CustomARView.swift
//  UTD Class Finder
//
//  Created by Shoaib Huq on 11/13/21.
//

import SwiftUI
import RealityKit
import ARKit

class CustomARView: ARView{
    // Referring to @EnvironmentObject
    var saveLoadState: SaveLoadState
    var arState: ARState
    
    var doneSaving: Bool = false
    var numExperiences: Int = -1 
    
    
    var defaultConfiguration: ARWorldTrackingConfiguration {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.environmentTexturing = .automatic
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            configuration.sceneReconstruction = .mesh
        }
        return configuration
    }
    // MARK: - Init and setup
    
    init(frame frameRect: CGRect, saveLoadState: SaveLoadState, arState: ARState) {
        self.numExperiences = UserDefaults.standard.integer(forKey: "numExperiences")
        print("DEBUG: numExperiences = \(self.numExperiences)")
//            self.numExperiences = numExp
//        } else {
//            self.numExperiences = -1
//        }
        self.saveLoadState = saveLoadState
        self.arState = arState
        super.init(frame: frameRect)
    }

    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc required dynamic init(frame frameRect: CGRect) {
        fatalError("init(frame:) has not been implemented")
    }

    func setup() {
        self.session.run(defaultConfiguration)
        self.session.delegate = self
        self.setupGestures()
        self.debugOptions = [ .showFeaturePoints ]
    }
    
    // MARK: - AR content
    var virtualObjectAnchor: ARAnchor?
    let virtualObjectAnchorName = "virtualObject"
//    var virtualObject = AssetModel(name: "teapot.usdz")
    var virtualObject = AssetModel(name: "arrow_3.usdz")
    var targetObject = AssetModel(name: "target.usdz")
    
    // MARK: - AR session management
    var isRelocalizingMap = false
    
 
    // MARK: - Persistence: Saving and Loading
    let storedData = UserDefaults.standard
    let mapKey = "ECSS"
    var keyIdentifier: [String] = ["0", "1", "2", "3", "4"]
    var saveKeyIndex: Int = 0
    var loadKeyIndex: Int = 0

    lazy var worldMapData: Data? = {
        var mapData = storedData.data(forKey: mapKey + "\(loadKeyIndex)")
        print("DEBUG: worldMapData accessed")
//        loadKeyIndex += 1
        
        return mapData
    }()
    
    func resetTracking() {
        self.session.run(defaultConfiguration, options: [.resetTracking, .removeExistingAnchors])
        self.isRelocalizingMap = false
        self.virtualObjectAnchor = nil
    }
}


