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
}
