//
//  RotatedBadgeSymbol.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/2020.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
