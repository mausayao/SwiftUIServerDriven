//
//  PetListViewModel.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 30/04/24.
//

import Foundation

@MainActor
class PetListViewModel: ObservableObject {
    
    private var webService: NetworkService
    @Published var components: [UIComponent] = []
    
    init(webService: NetworkService) {
        self.webService = webService
    }
    
    func load() async {
        do {
            let screenModel = try await webService.load(Constants.ScreenResources.petListing)
            components = try screenModel.buildComponent()
        } catch {
            print(error)
        }
    }
}
