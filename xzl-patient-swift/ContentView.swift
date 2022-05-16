//
//  ContentView.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/1620.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
           
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 200)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
//                       1 .font(.subheadline)
                    Spacer()
                    Text("California")
//                       1 .font(.subheadline)
                }
                .font(.subheadline) // 效果等同于1
                .foregroundColor(.secondary)
                
                Divider()
                Text("About Turtle Rock")
                    .font(.title)
                Text("Descriptive text goes here.")
                    .font(.subheadline)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
