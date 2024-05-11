//
//  FeaturedImageComponent.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 29/04/24.
//

import Foundation
import SwiftUI

struct FeaturedImageComponent: UIComponent {
    let uiModel: FeaturedImageUIModel
    
    var id = UUID()
    
    func render() -> AnyView {
        
        AsyncImage(url: uiModel.imageUrl) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }.toAnyView()
    }
    
    
}
