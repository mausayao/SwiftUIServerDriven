//
//  JSON.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 01/05/24.
//

import Foundation

enum DecodingError: Error {
    case dataCorruptedError
}

struct JSON: Decodable {
    
    var value: Any
    
    struct CodingKeys: CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
            self.stringValue = "\(intValue)"
            self.intValue = intValue
        }
    }
    
    init(from decoder: any Decoder) throws {
        if let container = try? decoder.container(keyedBy: CodingKeys.self) {
            var result: [String: Any] = [:]
            
            for key in container.allKeys {
                result[key.stringValue] = try container.decode(JSON.self, forKey: key).value
            }
            value = result
        } else if let container = try? decoder.singleValueContainer() {
            if let stringValue = try? container.decode(String.self) {
                value = stringValue
            } else if let intValue = try? container.decode(Int.self) {
                value = intValue
            } else if let boolValue = try? container.decode(Bool.self) {
                value = boolValue
            } else if let arrayValue = try? container.decode([JSON].self) {
                value = arrayValue
            } else {
                throw DecodingError.dataCorruptedError
            }
        } else {
            throw DecodingError.dataCorruptedError
        }
    }
}
