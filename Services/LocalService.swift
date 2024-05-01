//
//  LocalService.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 30/04/24.
//

import Foundation

class LocalService: NetworkService {
    
    func load(_ resource: String) async throws -> ScreenModel {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource file \(resource) not found!")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        let screenModel = try JSONDecoder().decode(ScreenModel.self, from: data)
        
        return screenModel
    }
}
