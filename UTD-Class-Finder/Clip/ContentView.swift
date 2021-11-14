//
//  ContentView.swift
//  App Guide Clip
//
//  Created by Shoaib Huq on 11/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex = 0
        
    var rooms = ["ECSS 2.415", "ECSS 2.416", "ECSS 2.417"]
    
    //@State private var selectedRoom: String = rooms[0]
    
    var body: some View {
        
        VStack{
            Text("Welcome to ECSS")
                .fontWeight(.bold)
                .font(.system(size: 35))
                .padding(40)
            HStack{
                Text("Select the room: ")
                
                Picker("Room Number", selection: $selectedIndex) {
                    ForEach(0..<rooms.count, content: { index in
                        Text(rooms[index])
                    })
                }
            }
            
            Button(action: {
                let sharedUserDefaults = UserDefaults(suiteName: "com.ShoaibH")
                if let data = sharedUserDefaults{
                    print(rooms[selectedIndex])
                    data.set(rooms[selectedIndex], forKey: "appClipData")
                }
                else{
                    print("App Failed to save data")
                }
                    
                
                
            }) {
                HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Guide Me!")
                }
                .padding(40)
                .font(.system(size: 25))
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
