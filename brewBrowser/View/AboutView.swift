//
//  AboutView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("launchScreenImage")
                    .resizable()
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 20, x: 0, y: 0.25)
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .scaledToFit()
                    .padding()
       
                HStack {
                    
                    Text("It's all about")
                    Link("brew.sh", destination: URL(string: "https://brew.sh/")!)
                    Text(":-)")
                }
                .font(.title)
                
                Spacer()
                
            }
            .padding()
            
            
            
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
