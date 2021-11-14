//
//  MainUI.swift
//  ARPersistence-Realitykit
//
//  Created by hgp on 1/15/21.
//

import SwiftUI

struct MainUI: View {
    
    @EnvironmentObject var arState: ARState
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .top) {
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        
                        Button("Forward", action: {arState.arrowRotation = .forward}).buttonStyle(.bordered)
                        Button("Backward", action: {arState.arrowRotation = .backward}).buttonStyle(.bordered)
                        Button("Left", action: {arState.arrowRotation = .left}).buttonStyle(.bordered)
                        Button("Right", action: {arState.arrowRotation = .right}).buttonStyle(.bordered)
                        Button("Up", action: {arState.arrowRotation = .up}).buttonStyle(.bordered)
                        Button("TARGET", action: {arState.targetPlacement = true}).buttonStyle(.bordered)
                        Spacer()
                    }
                }
                
                HStack {
                    if !arState.isThumbnailHidden {
                        if let image = arState.thumbnailImage {
                            SnapshotThumbnail(image: image)
                                .frame(width: 100, height: 200)
                                .aspectRatio(contentMode: .fit)
                                .padding(.leading, 10)
                        }
                    }
                    Spacer()
                }
                
                HStack {
                    MappingStatusView(statusLabel: arState.mappingStatus)
                        .frame(maxWidth: 100, alignment: .center)
                }
                
                HStack {
                    VStack {
//                        Group {
                            Text("load index: \(arState.loadIndex)")
                            Text("save index: \(arState.saveIndex)")
//                        }
                        
                    }
                    .font(.system(size: 15))
                    .padding(8)
                    .cornerRadius(8)
                    .background(Color.gray.opacity(0.4))
                    
                    Spacer()
                    
                    Button(action: {
                        print("DEBUG: reset tracking")
                        
                        arState.resetButton.isPressed = true
                    }) {
                        Image(systemName: "arrow.counterclockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                    .padding(.trailing, 20)
                }
            }
            
            Spacer()
            
            SessionInfo(label: arState.sessionInfoLabel)
            SaveLoadButton()
        }
    }
    
//    func ToggleRotation(to desiredRotation: ArrowRotation) {
//        for rotation in ArrowRotation.allCases {
//            if rotation != desiredRotation {
//                arState.
//            }
//        }
//    }
}

struct MainUI_Previews: PreviewProvider {
    
    static var previews: some View {
        MainUI()
            .environmentObject(ARState())
            .environmentObject(SaveLoadState())
    }
}
