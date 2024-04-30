//
//  ContentView.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = PetListViewModel(webService: .init())
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.components, id: \.id) { component in
                    component.render()
                }
                .navigationTitle("Pets")
            }.task {
               await viewModel.load()
            }
        }
    }
}

#Preview {
    ContentView()
}
