//
//  ProfileSummary.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/2020.
//

import SwiftUI

struct ProfileSummary: View {
    
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(profile.username)
                    .font(.title)
                    .bold()
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                                            .font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(radians: 90))
                            HikeBadge(name: "Tenth Day")
                                .grayscale(0.5)
                                .hueRotation(Angle(radians: 45))
                        }
                        .padding(.bottom)
                    }
                    
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                                            .font(.headline)
                    HikeView(hike: modelData.hikes[0])
                }
            }
            
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
