//
//  WebService.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 26/04/24.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case serverInvalidResponse
}

class WebService: NetworkService {
    
    func load(_ resource: String) async throws -> ScreenModel {
        
        guard let url = Constants.ScreenResources.resource(for: resource) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.serverInvalidResponse
        }
        
        return try JSONDecoder().decode(ScreenModel.self, from: data)
    }
}
