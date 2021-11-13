//
//  ARState.swift
//  UTD Class Finder
//
//  Created by Shoaib Huq on 11/13/21.
//

import Foundation

final class SaveLoadState: ObservableObject {
    @Published var saveButton = ButtonState(isEnabled: false)
    @Published var loadButton = ButtonState(isHidden: true)
}
