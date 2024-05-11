//
//  ListUiModel.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 11/05/24.
//

import Foundation

struct RowUiModel: Decodable {
    let id: Int
    let title: String
    let subTitle: String?
    let imageUrl: URL?
    let description: String?
}

struct ListUiModel: Decodable {
    
    let rows: [RowUiModel]
    let action: Action
}
