//
//  PetDetailViewModel.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 10/05/24.
//

import Foundation

@MainActor
class PetDetailViewModel: ObservableObject {
    
    private var webService: NetworkService
    @Published var components: [UIComponent] = []
    
    init(webService: NetworkService) {
        self.webService = webService
    }
    
    func load(petId: Int) async {
        do {
            var screenModel: ScreenModel
            
            if webService is LocalService {
                screenModel = try await webService.load("pet-detail")
            } else {
                screenModel = try await webService.load(Constants.ScreenResources.petDetail(petId: petId))
            }
            components = try screenModel.buildComponent()
        } catch {
            print(error)
        }
    }
}
