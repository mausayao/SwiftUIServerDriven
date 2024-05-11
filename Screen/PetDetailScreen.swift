//
//  PetDetailScreen.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 10/05/24.
//

import SwiftUI

struct PetDetailScreen: View {
    let petId: Int
    
    @StateObject private var viewModel = PetDetailViewModel(webService: LocalService())
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.components, id: \.id) { component in
                component.render()
            }
            .navigationTitle("Pets")
        }.task {
           await viewModel.load(petId: petId)
        }
    }
}

#Preview {
    PetDetailScreen(petId: 2)
}
