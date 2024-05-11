//
//  TextRowComponent.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 11/05/24.
//

import Foundation
import SwiftUI

struct TextRowComponent: UIComponent {
    let id: UUID = UUID()
    let uiModel: TextRowUiModel
    
    func render() -> AnyView {
        Text(uiModel.text)
            .padding()
            .toAnyView()
    }
}
