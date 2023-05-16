//
// PopulerNewResponse.swift
//  
//
//  Created by Alper Ban on 16.05.2023.
//

import Foundation

public struct PopularMovieResponse: Decodable {
    public let results: [New]
    private enum RootCodingKeys : String, CodingKey{
        case results
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        self.results = try container.decode([New].self, forKey: .results)
    }
}
