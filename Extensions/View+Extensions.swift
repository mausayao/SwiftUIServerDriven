//
//  View+Extensions.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 29/04/24.
//

import Foundation
import SwiftUI

extension View {
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
