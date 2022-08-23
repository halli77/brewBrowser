//
//  ContentView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import SwiftUI



struct ContentView: View {
    
   
    
    
    var body: some View {
        
   
            
        ZStack {
            TabView {
                    FormulaeView()
                        .tabItem{
                            Image(systemName: "list.dash.header.rectangle")
                            Text("Formulae")
                        }
                
                    CasksView()
                        .tabItem{
                            Image(systemName: "cylinder.fill")
                            Text("Casks")
                        }
    
                    StatView()
                        .tabItem{
                            Image(systemName: "chart.bar.xaxis")
                            Text("Stats")
                        }
                
                    AboutView()
                        .tabItem{
                            Image(systemName: "questionmark.square.dashed")
                            Text("About")
                        }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    

}












struct ContentView_Previews: PreviewProvider {
    
    
    
    static var previews: some View {
        ContentView()
    }
}
