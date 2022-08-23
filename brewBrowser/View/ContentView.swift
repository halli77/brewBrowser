//
//  ContentView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import SwiftUI



struct ContentView: View {

    
//    @StateObject private var formulaVm = BrewFormulaViewModel()
//    @StateObject private var caskVm = BrewCaskViewModel()
//    @StateObject private var statVm = BrewStatViewModel()
    
    @EnvironmentObject private var formulaVm: BrewFormulaViewModel
    @EnvironmentObject private var caskVm: BrewCaskViewModel
    @EnvironmentObject private var statVm: BrewStatViewModel
    
    var body: some View {
        
   
            
        ZStack {
            TabView {
                    AboutView()
                    .tabItem{
                        Image(systemName: "questionmark.square.dashed")
                        Text("About")
                    }
                
                    FormulaeView()
                    .environmentObject(formulaVm)
                        .tabItem{
                            Image(systemName: "list.dash.header.rectangle")
                            Text("Formulae")
                        }
                
                    CasksView()
                    .environmentObject(caskVm)
                        .tabItem{
                            Image(systemName: "cylinder.fill")
                            Text("Casks")
                        }
    
                    StatView()
                    .environmentObject(statVm)
                        .tabItem{
                            Image(systemName: "chart.bar.xaxis")
                            Text("Stats")
                        }
                
                    
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    

}












struct ContentView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        ContentView()
            .environmentObject(BrewFormulaViewModel())
            .environmentObject(BrewCaskViewModel())
            .environmentObject(BrewStatViewModel())
    }
}
