//
//  CascDetailsView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 20.08.22.
//

import SwiftUI

struct CaskDetailsView: View {
    
    let cask: BrewCaskModel
    
    var body: some View {
        VStack (alignment: .leading) {
            
            List {
                Section(
                    header:
                        VStack (alignment: .leading) {
                            
                            HStack  {
                                Image(systemName: "cylinder.fill")
                                Text("\(cask.name[0])")
                            }
                            .font(.headline)
        
                            
                            Text("\(cask.desc ?? "-")")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                        }
                        
                ) {
                   
                    
                    myListItem(field: "token", value: "\(cask.token)")
                    myListItem(field: "version", value: "\(cask.version)")
                    myListItem(field: "sha256", value: "\(cask.sha256)")
            
                }
                
                Section(header: Text("Homepage")) {
                    if cask.homepage == "" {
                        myListItem(field: "Homepage", value: "-")
                    } else {
                        Link("\(cask.homepage)", destination: URL(string: "\(cask.homepage)")!)
                    }

                }
            }
            
            
            Spacer()
   
        }

    }
    
}


struct myListItem: View {
    let field: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(field)")
                .font(.caption)
                .foregroundColor(.gray)
            Spacer()
            Text("\(value)")

        }
    }
}


struct CaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CaskDetailsView(cask: BrewCaskModel(
            token: "test",
            name: ["Demo"],
            desc: "test",
            homepage: "www.tagesschaue.de",
            version: "1.0",
            installed: "50",
            outdated: false,
            sha256: "abcdasdfakjdfasdöfadfdsfsfjadf"
        ))
    }
}
