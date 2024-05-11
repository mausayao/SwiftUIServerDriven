//
//  CarouselUIModel.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 01/05/24.
//

import Foundation

struct CarouselUIModelRow: Decodable, Identifiable {
    let id = UUID()
    let petId: Int
    let imageUrl: URL
    
    enum CodingKeys: String, CodingKey {
        case petId
        case imageUrl
    }
}

struct CarouselUIModel: Decodable {
    let items: [CarouselUIModelRow]
    let action: Action
}
