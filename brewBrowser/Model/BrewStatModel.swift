//
//  BrewCaskStatModel.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


struct BrewStatModel: Codable, Identifiable {
    //let category: String
    //let totalItems: Int
    //let startDate, endDate: String
    //let totalCount: Int
    let items: [BrewStatItem]
    var id: String = UUID().uuidString
    

    enum CodingKeys: String, CodingKey {
        //case category
        //case totalItems
        //case startDate
        //case endDate
        //case totalCount
        case items
    }
}


struct BrewStatItem: Codable, Identifiable {
    let number: Int
    let cask, count, percent: String
    var id: String = UUID().uuidString
    
    
    enum CodingKeys: String, CodingKey {
        case number
        case cask, count, percent
    }
    
}
