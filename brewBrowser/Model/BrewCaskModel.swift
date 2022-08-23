//
//  CaskModel.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import Foundation



struct BrewCaskModel: Codable, Identifiable  {
    let token: String
    let name: [String]
    let desc: String?
    let homepage: String
    let version: String
    let installed: String?
    let outdated: Bool?
    let sha256: String
    
    var id: String {
        self.token
    }
    
    var searchString: String {
        (self.name[0] + (self.desc ?? " ")).lowercased()
    }

    enum CodingKeys: String, CodingKey {
        case token
        case name
        case desc
        case homepage 
        case version
        case installed
        case outdated
        case sha256
    }
    
}
