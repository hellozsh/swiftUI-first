//
//  Profile.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/2020.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    // default是关键字，所有需要``包裹以下
    static let `default` = Profile(username: "g_kumar")

    enum Season: String, CaseIterable, Identifiable {
        
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
