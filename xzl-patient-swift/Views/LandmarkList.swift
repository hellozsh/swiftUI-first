//
//  LandmarkList.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/1620.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly && landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            
//            List(landmarks) { landmark in
//
//                NavigationLink {
//                    LandmarkDetail(landmark: landmark)
//                } label: {
//                    LandmarkRow(landmark: landmark)
//                }
//            }
            
            
            
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
                    LandmarkList()
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .previewDisplayName(deviceName)
                }
//        LandmarkList()
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    }
}
