//
//  ViewModel.swift
//  UTD-Class-Finder
//
//  Created by Shoaib Huq on 11/14/21.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var rooms : [String]
    
    var buildings = ["ECSS", "ECSN", "ECSW", "ATEC", "JO"]
    
    var Srooms = ["ECSS 2.415", "ECSS 2.416", "ECSS 2.417"]
    var Wrooms = ["ECSW 1.415", "ECSW 1.416", "ECSW 1.417"]
    var Nrooms = ["ECSN 1.213", "ECSN 1.312", "ECSN 1.524"]
    var Arooms = ["ATEC 3.415", "ATEC 3.416", "ATEC 3.417"]
    
    init() {
        rooms = Srooms
    }
    
    func ChangeBuilding(toIndex index: Int) {
        switch (index) {
        case 0:
            rooms = Srooms
        case 1:
            rooms = Wrooms
        case 2:
            rooms = Nrooms
        default:
            rooms = Arooms
        }
    }
}

