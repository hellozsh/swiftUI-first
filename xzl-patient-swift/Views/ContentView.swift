//
//  ContentView.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/1620.
//

import SwiftUI

struct ContentView: View {

    @State private var selection: Tab = .category
    
    enum Tab {
        case category
        case landmark
    }
    
    var body: some View {
        TabView(selection: $selection) {
            
            LandmarkList()
                .tabItem {
                    Label("landmark", systemImage: "list.bullet")
                }
                .tag(Tab.landmark)
            
            CategoryHome()
                .tabItem {
                    Label("category", systemImage: "star")
                }
                .tag(Tab.category)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
