//
//  ScreenModel.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 26/04/24.
//

import Foundation

enum ComponentType: String, Decodable {
    case featuredImage
}

struct ComponentModel: Decodable {
    let type: ComponentType
    let data: [String: String]
}

struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}
