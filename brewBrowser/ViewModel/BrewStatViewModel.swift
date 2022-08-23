//
//  BrewCaskStatViewModel.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//



import Foundation


enum StatTypes {
    case monthly
    case quaterly
    case annually
}


class BrewStatViewModel: ObservableObject {
    
    @Published var stat30d: BrewStatModel = BrewStatModel(items: [BrewStatItem(number: 0, cask: "", count: "", percent: "")])
    @Published var stat90d: BrewStatModel = BrewStatModel(items: [BrewStatItem(number: 0, cask: "", count: "", percent: "")])
    @Published var stat365d: BrewStatModel = BrewStatModel(items: [BrewStatItem(number: 0, cask: "", count: "", percent: "")])
    
  
    
    init() {
        print("initalizing vm")
        getStat(for: .monthly)
        getStat(for: .quaterly)
        getStat(for: .annually)
    }
    
    public func getStatData(for period: StatTypes) -> [BrewStatItem] {
  
        switch period {
        case .monthly:
            return stat30d.items
        case .quaterly:
            return stat90d.items
        case .annually:
            return stat365d.items
            
        }
       
    }
    
    
    func getStat(for period: StatTypes) {
        
        var endpoint = ""
        
        switch period {
        case .monthly:
            endpoint = "https://formulae.brew.sh/api/analytics/cask-install/30d.json"
        case .quaterly:
            endpoint = "https://formulae.brew.sh/api/analytics/cask-install/90d.json"
        case .annually:
            endpoint = "https://formulae.brew.sh/api/analytics/cask-install/365d.json"
        }
        
        
        
        guard let url = URL(string: endpoint) else {
            print("not a valid url!!!")
            return
            
        }
        
    
        downloadData(from: url) { (returnedData) in
            if let data = returnedData {
                print("DATA: \(data)")
                do {
                    let newStat = try JSONDecoder().decode(BrewStatModel.self, from: data)
                    DispatchQueue.main.async { [weak self] in
                        
                        switch period {
                        case .monthly:
                            self?.stat30d = newStat
                        case .quaterly:
                            self?.stat90d = newStat
                        case .annually:
                            self?.stat365d = newStat
                        }
                        
                        print(newStat)
                        print("done")
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
