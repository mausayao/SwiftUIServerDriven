//
//  ListComponent.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 11/05/24.
//

import Foundation
import SwiftUI

struct ListComponent: UIComponent {
    let id: UUID = UUID()
    let uiModel: ListUiModel
    
    func render() -> AnyView {
        ForEach(uiModel.rows, id: \.id) { row in
            Navigator.perform(action: uiModel.action, payload: row) {
                RowComponent(uiModel: row).render().toAnyView()
            }
        }.toAnyView()
    }
    
    
}
