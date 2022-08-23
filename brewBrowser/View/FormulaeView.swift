//
//  FormulaeView.swift
//  brewBrowser
//
//  Created by Michael Hallmann on 21.08.22.
//

import SwiftUI

struct FormulaeView: View {
    
    // @StateObject var vm = BrewFormulaViewModel()
    @EnvironmentObject private var vm: BrewFormulaViewModel
    
    @State var formulae: [BrewFormulaModel] = []
    @State var selectedModel: BrewFormulaModel? = nil
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(formulae) { formula in
                    VStack(alignment: .leading) {
                        Text("\(formula.name)")
                            .font(.headline)
                        Text("\(formula.desc)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    // .background(.red)
                    .onTapGesture {
                        selectedModel = formula
                    }
                    .sheet(item: $selectedModel) { model in
                        FormulaDetailsView(formula: model)
                    }
                }
            }
            .navigationTitle("Formulae")
            .listStyle(.plain)
            .onAppear() {
                formulae = vm.formulae                
            }
            
        }
        .searchable(text: $searchText, placement: .automatic)
        .onChange(of: searchText) { newValue in
            if !newValue.isEmpty {
                formulae = vm.getFilteredFormulae(searchText: newValue)
            } else {
                formulae = vm.formulae
            }

        }

    }
        
 
}

struct FormulaeView_Previews: PreviewProvider {
    static var previews: some View {
        FormulaeView()
            .environmentObject(BrewFormulaViewModel())
    }
}
