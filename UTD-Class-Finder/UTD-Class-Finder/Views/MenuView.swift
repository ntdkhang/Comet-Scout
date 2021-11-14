//
//  MenuVIew.swift
//  UTD-Class-Finder
//
//  Created by Nguyen Tran Duy Khang on 11/13/21.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
//        List {
            
//        }
        NavigationView {
            VStack {
                NavigationLink(destination: {}, label: {Text("Student View")})
                NavigationLink(destination: {}, label: {Text("Developer View")})
            }
        }
    }
}

//struct StudentView: View {
//    var body: some View {
//
//    }
//}
//
//
//struct DeveloperView: View {
//    var body: some View {
//
//
//    }
//}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
