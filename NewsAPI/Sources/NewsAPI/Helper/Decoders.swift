//
//  Decoders.swift
//  
//
//  Created by Alper Ban on 16.05.2023.
//

import Foundation

public enum Decoders {
    static let dateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted((dateFormatter))
        return decoder
    }()
}
