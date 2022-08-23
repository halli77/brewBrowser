//
//  BrewCaskViewModel.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import Foundation
import SwiftUI

class BrewFormulaViewModel: ObservableObject {
    
    @Published var formulae: [BrewFormulaModel] = []
    
    
    init() {
        print("initalizing BrewFormulaViewModel")
        getFormulae()
    }
    
    
    func getFilteredFormulae(searchText: String) -> [BrewFormulaModel] {
        let filtered = formulae.filter { formula in
            formula.searchString.contains(searchText.lowercased())
        }
        return filtered
    }
    
    
    
    func getFormulae() {
        
        guard let url = URL(string: "https://formulae.brew.sh/api/formula.json") else {
            print("not a valid url!!!")
            return
            
        }
        
    
        downloadData(from: url) { (returnedData) in
            if let data = returnedData {
                print("DATA: \(data)")
                do {
                    let newFormulae = try JSONDecoder().decode([BrewFormulaModel].self, from: data)
                    DispatchQueue.main.async { [weak self] in
                        self?.formulae  = newFormulae
                        // print(newFormulae)
                        print("finished downloading formulae")
                    }
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                
                
        
                
                
            } else {
                print("no data returned.")
            }
        }
        
                
    }
    
    func downloadData(from url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        print("Start downloadData")
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("No data")
                return
            }
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Bad status code: \(response.statusCode)")
                return
            }
            
            print("Download successful!")
            
            completionHandler(data)
        }.resume()
    }
}
