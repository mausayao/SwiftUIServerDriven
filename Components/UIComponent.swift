//
//  UIComponent.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 29/04/24.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var id: UUID { get }
    func render() -> AnyView
}
