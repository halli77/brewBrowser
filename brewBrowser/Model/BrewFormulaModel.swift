//
//  BrewFormulaeModel.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 21.08.22.
//

import Foundation

struct BrewFormulaModel: Codable, Identifiable {
    let name: String
    //let fullName: String
    let oldname: String?
    let aliases: [String]
    let versionedFormulae: [String]?
    let desc: String
    let license: String?
    let homepage: String
    let revision: Int
    let versionScheme: Int?
    let kegOnly: Bool?
    let buildDependencies: String?
    let dependencies: [String]?
    let conflictsWith: [String]?
    let caveats: String?
    let pinned: Bool?
    let outdated: Bool?
    let deprecated: Bool?
    let deprecationDate, deprecationReason: String?
    let disabled: Bool
    let disableDate, disableReason: String?
    
    var id: String {
        self.name
    }
    
    var searchString: String {
        (self.name + self.desc).lowercased()
    }

    enum CodingKeys: String, CodingKey {
        case name
        //case fullName
        case oldname, aliases
        case versionedFormulae
        case desc, license, homepage, revision
        case versionScheme
        case kegOnly
        case buildDependencies
        case dependencies
        case conflictsWith
        case caveats
        case pinned, outdated, deprecated
        case deprecationDate
        case deprecationReason
        case disabled
        case disableDate
        case disableReason
    }
}
