//
//  StatView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import SwiftUI

struct StatView: View {
    
    @StateObject var vm = BrewStatViewModel()
    @State var selectedStatType: StatTypes = .monthly
    
 
    
    var body: some View {
        ZStack {
           
            VStack {
                Picker("Flavor", selection: $selectedStatType) {
                    Text("monthly").tag(StatTypes.monthly)
                    Text("quaterly").tag(StatTypes.quaterly)
                    Text("annually").tag(StatTypes.annually)
                }.pickerStyle(.segmented)
                List {
                    ForEach(vm.getStatData(for: selectedStatType)) { item in
                        
                        if item.number <= 50 {
                            HStack {
                                Text("#\(item.number): \(item.cask)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 5)
                                Spacer()
                                Text("\(item.count)")
                                    .font(.subheadline)
                                    .fontWeight(.thin)
                                    .padding(.bottom, 5)
                            }
                            
                        }
                        
                            
                    }
                       
                }
                
            }
            
            
        }
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView()
    }
}
