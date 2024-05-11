//
//  RatingRowComponent.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 11/05/24.
//

import Foundation
import SwiftUI

struct RatingRowComponent: UIComponent {
    let id: UUID = UUID()
    let uiModel: RatingRowUiModel
    
    func render() -> AnyView {
        RatingView(rating: .constant(uiModel.value)).toAnyView()
    }
}
