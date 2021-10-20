//
//  ContentView.swift
//  Shared
//
//  Created by Mobile World on 10/19/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                }
            DiscoverView()
                .tabItem {
                    Image(systemName: "location.circle.fill")
                }
            Text("Message")
                .tabItem {
                    Image(systemName: "ellipses.bubble.fill")
                }
        }.padding([.top], 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
