//
//  CustomARView+Persistence.swift
//  UTD Class Finder
//
//  Created by Shoaib Huq on 11/13/21.
//

import Foundation
import SwiftUI
import RealityKit
import ARKit

extension CustomARView {
    // MARK: - Persistence: Saving and Loading
    
    func loadExperience() {
        
        /// - Tag: ReadWorldMap
        let worldMap: ARWorldMap = {
            guard let data = UserDefaults.standard.data(forKey: self.mapKey + "\(self.loadKeyIndex)")
                else { fatalError("Map data should already be verified to exist before Load button is enabled.") }
            self.loadKeyIndex += 1
            do {
                guard let worldMap = try NSKeyedUnarchiver.unarchivedObject(ofClass: ARWorldMap.self, from: data)
                    else { fatalError("No ARWorldMap in archive.") }
                print("DEBUG: Unarchived map data with key \(self.loadKeyIndex - 1)")
                return worldMap
            } catch {
                fatalError("Can't unarchive ARWorldMap from file data: \(error)")
            }
        }()
        
        // Display the snapshot image stored in the world map to aid user in relocalizing.
        if let snapshotData = worldMap.snapshotAnchor?.imageData,
            let snapshot = UIImage(data: snapshotData) {
            self.arState.thumbnailImage = snapshot
        } else {
            print("No snapshot image in world map")
        }

        // Remove the snapshot anchor from the world map since we do not need it in the scene.
        worldMap.anchors.removeAll(where: { $0 is SnapshotAnchor })

        let configuration = self.defaultConfiguration // this app's standard world tracking settings
        configuration.initialWorldMap = worldMap
        self.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])

        isRelocalizingMap = true
        virtualObjectAnchor = nil
    }
    
    func saveExperience() {
        self.session.getCurrentWorldMap { worldMap, _ in
            guard let map = worldMap else {
                self.arState.sessionInfoLabel = "Can't get current world map"
                return
            }
            
            // Add a snapshot image indicating where the map was captured.
            guard let snapshotAnchor = SnapshotAnchor(capturing: self)
                else { fatalError("Can't take snapshot") }
            map.anchors.append(snapshotAnchor)
            
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: map, requiringSecureCoding: true)
                self.storedData.set(data, forKey: self.mapKey + "\(self.saveKeyIndex)")
                print("DEBUG: Archived map data with key \(self.saveKeyIndex)")
                self.saveKeyIndex += 1
                DispatchQueue.main.async {
                    self.saveLoadState.loadButton.isHidden = false
                    self.saveLoadState.loadButton.isEnabled = true
                }
            } catch {
                fatalError("Can't save map: \(error.localizedDescription)")
            }
        }
    }
    
}
