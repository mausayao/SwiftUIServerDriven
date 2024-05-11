//
//  EmptyComponent.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 11/05/24.
//

import Foundation
import SwiftUI

struct EmptyComponent: UIComponent {
    var id: UUID = UUID()
    
    func render() -> AnyView {
        EmptyView().toAnyView()
    }
}
