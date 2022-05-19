//
//  LandmarkList.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/1620.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
//            效果同上一个
//            List(filteredLandmarks) { landmark in
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
        
        LandmarkList()
            .environmentObject(ModelData())
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
//                    LandmarkList()
//                        .previewDevice(PreviewDevice(rawValue: deviceName))
//                        .previewDisplayName(deviceName)
//                }
//        LandmarkList()
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
    }
}
