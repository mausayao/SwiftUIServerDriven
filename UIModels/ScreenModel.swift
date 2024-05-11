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
    case carousel
    case textRow
    case rating
    case list
}

struct ComponentModel: Decodable {
    let type: ComponentType?
    let data: [String: Any]
    
    enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try? container.decode(ComponentType.self, forKey: .type)
        
        guard let data = try container.decode(JSON.self, forKey: .data).value as? [String: Any] else {
            throw ComponentError.decodingError
        }
        
        self.data = data
    }
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
            case .carousel:
                guard let uiModel: CarouselUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                
                uiComponents.append(CarouselComponent(uiModel: uiModel))
            case .textRow:
                guard let uiModel: TextRowUiModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                
                uiComponents.append(TextRowComponent(uiModel: uiModel))
                
            case .rating:
                guard let uiModel: RatingRowUiModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                
                uiComponents.append(RatingRowComponent(uiModel: uiModel))
                
            case .list:
                guard let uiModel: ListUiModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                
                uiComponents.append(ListComponent(uiModel: uiModel))
            case .none:
                uiComponents.append(EmptyComponent())
            }
        }
        
        return uiComponents
    }
}
