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
        
        static func resource(for resourceName: String) -> URL? {
            var component = URLComponents()
            
            component.scheme = "http"
            component.encodedHost = baseUrl
            component.path = "/\(resourceName)"
            
            return component.url
        }
    }
}
