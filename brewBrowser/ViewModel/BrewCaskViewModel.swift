//
//  BrewCaskViewModel.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import Foundation
import SwiftUI

class BrewCaskViewModel: ObservableObject {
    
    @Published var casks: [BrewCaskModel] = []
    
    
    init() {
        print("initalizing BrewCaskViewModel")
        getCasks()
    }
    
    func getFilteredCasks(searchText: String) -> [BrewCaskModel] {
        let filtered = casks.filter { cask in
            cask.searchString.contains(searchText.lowercased())
        }
        return filtered
    }
    
    func getCasks() {
        
        guard let url = URL(string: "https://formulae.brew.sh/api/cask.json") else {
            print("not a valid url!!!")
            return
            
        }
        
        
    
        downloadData(from: url) { (returnedData) in
            if let data = returnedData { 
                print("DATA: \(data)")
                print("from: \(url)")
                do {
                    let newCasks = try JSONDecoder().decode([BrewCaskModel].self, from: data)
                    DispatchQueue.main.async { [weak self] in
                        self?.casks = newCasks 
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
        print("Start downloadData from \(url)")
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
            
            print("Download successful from \(url)!")
            
            completionHandler(data)
        }.resume()
    }
}
