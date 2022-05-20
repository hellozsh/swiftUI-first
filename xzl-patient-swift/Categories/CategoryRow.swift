//
//  CategoryRow.swift
//  xzl-patient-swift
//
//  Created by 周素华 on 2022/5/2020.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { item in
                        Text(item.name)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryRow(
            categoryName: ModelData().landmarks[0].category.rawValue,
            items: Array(ModelData().landmarks.prefix(4))
        )
            .previewDevice("iPhone 11")
    }
}
