//
//  CarouselComponent.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 01/05/24.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    
    let uiModel: CarouselUIModel
    
    var id = UUID()
    
    func render() -> AnyView {
        CarouselView(uiModel: uiModel).toAnyView()
    }
}
