//
//  Constants.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 26/04/24.
//

import Foundation

struct Constants {
    
    struct ScreenResources {
        static let baseUrl = "localhost:3000"
        static let petListing = "pet-listing"
        
        static func petDetail(petId: Int) -> String {
            return "pet-detail/\(petId)"
        }
        
        static func resource(for resourceName: String) -> URL? {
            var components: URLComponents = URLComponents()
            components.scheme = "http"
            components.path = "/\(resourceName)"
            components.port = 3000
            components.encodedHost = "localhost"
            
            return components.url
        }
    }
}
