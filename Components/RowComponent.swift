//
//  RowComponent.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 11/05/24.
//

import Foundation
import SwiftUI

struct RowComponent: UIComponent {
    
    var id: UUID = UUID()
    let  uiModel: RowUiModel
    
    func render() -> AnyView {
        HStack {
            if let imageUrl = uiModel.imageUrl {
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                }.toAnyView()
            }
            
            VStack(alignment: .leading) {
                Text(uiModel.title)
                Text(uiModel.subTitle ?? "").opacity(0.4)
                Text(uiModel.description ?? "")
            }
        }.padding()
            .toAnyView()
    }
    
    
}
