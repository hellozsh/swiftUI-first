//
//  Detail.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/1720.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData

    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }

    var body: some View {
        ScrollView() {
           
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 200)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
//                       1 .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
//                       1 .font(.subheadline)
                }
                .font(.subheadline) // 效果等同于1
                .foregroundColor(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                    .font(.subheadline)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct Detail_Previews: PreviewProvider {
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[1])
    }
}
