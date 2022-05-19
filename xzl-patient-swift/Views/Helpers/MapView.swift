//
//  MapView.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/1620.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    
    var coordinate: CLLocationCoordinate2D
    
    /**
     你可以使用@State属性为你的应用程序中的数据建立一个真实的来源，你可以从多个视图中修改这些数据。SwiftUI管理底层存储，并根据值自动更新视图。
    */
    // 创建一个私有状态变量，用于保存映射的区域信息。
    @State private var region = MKCoordinateRegion()
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 28, longitude: 104))
    }
}
