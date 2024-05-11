//
//  ContentView.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = PetListViewModel(webService: LocalService())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
                .navigationTitle("Pets")
            }.listStyle(.plain)
            .task {
               await viewModel.load()
            }
        }
    }
}

#Preview {
    ContentView()
}
