//
//  FormulaDetailsView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 21.08.22.
//

import SwiftUI

struct FormulaDetailsView: View {
    let formula: BrewFormulaModel
    
    var body: some View {
        VStack (alignment: .leading) {
            
            List {
                Section(
                    header:
                        VStack (alignment: .leading) {
                            
                            HStack  {
                                Image(systemName: "list.dash.header.rectangle")
                                Text("\(formula.name)")
                            }
                            .font(.headline)
        
                            
                            Text("\(formula.desc)")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                        }
                        
                ) {
                   
                    
                    // myListItem(field: "name", value: "\(formula.name)")
                    myListItem(field: "license", value: "\(formula.license ?? "-")")
            
                }
                
                Section(header: Text("Homepage")) {
                    
                        Link("\(formula.homepage)", destination: URL(string: "\(formula.homepage)")!)
                  

                }
            }
            
            
            Spacer()
   
        }

    }
}

struct FormulaDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FormulaDetailsView(formula: BrewFormulaModel(
            name: "test",
            oldname: "oldname",
            aliases: ["alias1"],
            versionedFormulae: ["version1"],
            desc: "description",
            license: "MIT",
            homepage: "127.0.0.1",
            revision: 1,
            versionScheme: 2,
            kegOnly: false,
            buildDependencies: "none",
            dependencies: ["none"],
            conflictsWith: ["none"],
            caveats: "",
            pinned: true,
            outdated: false,
            deprecated: false,
            deprecationDate: "",
            deprecationReason: "",
            disabled: false,
            disableDate: "",
            disableReason: ""))
    }
}
