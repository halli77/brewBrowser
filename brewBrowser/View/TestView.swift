//
//  TestView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 22.08.22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink(destination: EmptyView()) {
                    Label("Hallo Welt", systemImage: "01.square")
                }
                
                NavigationLink(destination: AboutView()) {
                    Label("About", systemImage: "02.square")
                }

            }.listStyle(.sidebar)
        }
        .navigationTitle(/*@START_MENU_TOKEN@*/"MyApp"/*@END_MENU_TOKEN@*/)
 
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
