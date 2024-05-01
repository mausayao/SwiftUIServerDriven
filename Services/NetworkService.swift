//
//  NetworkService.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 30/04/24.
//

import Foundation

protocol NetworkService {
    func load(_ resource: String) async throws -> ScreenModel
}
