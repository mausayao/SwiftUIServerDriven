//
//  ScreenModel.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 26/04/24.
//

import Foundation

enum ComponentError: Error {
    case decodingError
}

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

extension ScreenModel {
    func buildComponent() throws -> [UIComponent] {
        var uiComponents: [UIComponent] = []
        
        for component in self.components {
            switch component.type {
            case .featuredImage:
                guard let uiModel: FeaturedImageUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                
                uiComponents.append(FeaturedImageComponent(uiModel: uiModel))
            }
        }
        
        return uiComponents
    }
}
