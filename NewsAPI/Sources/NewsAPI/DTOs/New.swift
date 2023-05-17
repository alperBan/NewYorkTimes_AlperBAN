//
//  New.swift
//  
//
//  Created by Alper Ban on 15.05.2023.
//

import Foundation

public struct NewResult: Decodable{
        public let results: [New]?
    
     
        
        enum CodingKeys: String, CodingKey {
            case results
        }
    }


    public struct New: Decodable {
        public let section: String?
        public let subsection: String?
        public let title: String?
        public let abstract: String?
        public let byline: String?
        public let url: String?
        public let multimedia: [Multimedia]
        
        enum CodingKeys: String, CodingKey {
            case section = "section"
            case subsection = "subsection"
            case title = "title"
            case abstract = "abstract"
            case byline = "byline"
            case url = "url"
            case multimedia
        }
    }

public struct Multimedia:Decodable {
    public let urll : String?
    
    enum CodingKeys: String, CodingKey{
        case urll = "url"
    }
}

