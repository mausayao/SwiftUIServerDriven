//
//  Action.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 02/05/24.
//

import Foundation

enum ActionType: String, Decodable {
    case sheet
    case push
}

struct Action: Decodable {
    let type: ActionType
    let destination: Route
}
