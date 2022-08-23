//
//  CaskView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 19.08.22.
//

import SwiftUI

struct CasksView: View  {
    
    @StateObject var vm = BrewCaskViewModel()
    @State var casks: [BrewCaskModel] = []
    @State var selectedModel: BrewCaskModel? = nil
    @State private var searchText = ""
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(casks) { cask in
                    VStack(alignment: .leading) {
                        Text("\(cask.name[0])")
                            .font(.headline)
                        Text("\(cask.desc ?? "...")")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    //.background(.red)
                    .onTapGesture {
                        selectedModel = cask
                    }
                    .sheet(item: $selectedModel) { model in
                        CaskDetailsView(cask: model)
                    }
                }
            }
            .navigationTitle("Casks")
            .listStyle(.plain)
            .onAppear() {
                casks = vm.casks
            }

        }
        .searchable(text: $searchText, placement: .automatic)
        .onChange(of: searchText) { newValue in
            if !newValue.isEmpty {
                casks = vm.getFilteredCasks(searchText: newValue)
            } else {
                casks = vm.casks
            }

        }
    }
        
}








struct CaskView_Previews: PreviewProvider {
    static var previews: some View {
        CasksView()
    }
}








//VStack(alignment: .leading) {
//    HStack {
//        Text("\(cask.name[0])")
//            .font(.subheadline)
//            .fontWeight(.semibold)
//            .padding(.bottom, 5)
//        Spacer()
//        if let homepage = URL(string: cask.homepage) {
//            Link(destination: homepage) {
//                Image(systemName: "globe")
//            }
//        }
//
//    }
//
//
//    Text("\(cask.desc ?? "...")")
//        .font(.caption)
//        .foregroundColor(.gray)
//}
