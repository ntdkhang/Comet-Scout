//
//  HomeScreen.swift
//  UTD-Class-Finder
//
//  Created by Shoaib Huq on 11/14/21.
//

import SwiftUI



struct HomeScreen: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var selectedRoomIndex = 0
    @State private var selectedBuildingIndex = 0
    //    @State private var rooms: [String]
    
    var buildings = ["ECSS", "ECSN", "ECSW", "ATEC", "JO"]
    
    var Srooms = ["ECSS 2.415", "ECSS 2.416", "ECSS 2.417"]
    var Wrooms = ["ECSW 1.415", "ECSW 1.416", "ECSW 1.417"]
    var Nrooms = ["ECSN 1.213", "ECSN 1.312", "ECSN 1.524"]
    var Arooms = ["ATEC 3.415", "ATEC 3.416", "ATEC 3.417"]
    
    //    lazy var rooms: [String] = {
    //        switch(buildings[selectedBuildingIndex]) {
    //        case "ECSS":
    //            return Srooms
    //        default:
    //            return Arooms
    //        }
    //    }
    var rooms: [String] = ["ECSS 2.415", "ECSS 2.416", "ECSS 2.417"]
    
    
    var logo: UIImage = UIImage(named: "utdLogo2.png")!
    var body: some View {
        NavigationView{
            VStack{
                Image(uiImage: logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(25)
                VStack{
                    Text("Find the room you want to go to: ")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(30)
                    HStack {
                        Text("Select the building: ")
                        
                        Picker("Building Name", selection: $selectedBuildingIndex) {
                            ForEach(0..<rooms.count, content: { index in
                                Text(rooms[index])
                                
                            })
                        }.onSubmit {
                            viewModel.ChangeBuilding(toIndex: selectedBuildingIndex)
                        }
                    }
                    
                    HStack{
                        Text("Select the room: ")
                        
                        Picker("Room Number", selection: $selectedRoomIndex) {
                            ForEach(0..<rooms.count, content: { index in
                                Text(rooms[index])
                            })
                        }
                    }
                }
                Spacer()
            }
        }
    }
    
}
