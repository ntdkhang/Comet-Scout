//
//  ARState.swift
//  UTD Class Finder
//
//  Created by Shoaib Huq on 11/13/21.
//

import Foundation
import SwiftUI

final class ARState: ObservableObject {
    @Published var sessionInfoLabel = "Initializing"
    @Published var isThumbnailHidden = true
    @Published var thumbnailImage: UIImage?
    @Published var mappingStatus = "Mapping: "
    @Published var resetButton = ButtonState()
    @Published var loadIndex = 0
    @Published var saveIndex = 0
    @Published var mode = 0 //      1 = developer,     0 = student
    @Published var arrowRotation: ArrowRotation = .forward
    @Published var targetPlacement = false
}

enum ArrowRotation: CaseIterable {
    case forward, backward, left, right, up 
}
