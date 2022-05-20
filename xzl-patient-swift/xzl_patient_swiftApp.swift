//
//  xzl_patient_swiftApp.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/1620.
//

import SwiftUI

@main
struct xzl_patient_swiftApp: App {
    
    
    //    Use the @StateObject attribute to initialize a model object for a given property only once during the life time of the app. This is true when you use the attribute in an app instance, as shown here, as well as when you use it in a view
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        // xcrun simctl list devicetypes 可以查询所有可设置预览的设备
    }
}
