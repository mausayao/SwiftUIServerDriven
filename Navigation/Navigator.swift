//
//  Navigator.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 06/05/24.
//

import Foundation
import SwiftUI

struct SheetView<V: View>: View {
    
    @State private var isPresented: Bool = false
    let content: () -> V
    let destinationView: AnyView
    
    var body: some View {
        content().onTapGesture {
            isPresented = true
        }.sheet(isPresented: $isPresented) {
            destinationView
        }
    }
}

class Navigator {
    static func perform<V: View>(action: Action, payload: Any? = nil, content: @escaping () -> V) -> AnyView {
        var destinationView: AnyView
        
        switch action.destination {
        case .petDetail:
            if let payload = payload as? CarouselUIModelRow {
                destinationView = PetDetailScreen(petId: payload.petId).toAnyView()
            } else if let payload = payload as? RowUiModel {
                destinationView = PetDetailScreen(petId: payload.id)
                    .navigationTitle(payload.title)
                    .toAnyView()
            } else {
                destinationView = EmptyView().toAnyView()
            }
            
        }
        
        switch action.type {
        case .sheet:
            return SheetView(
                content: {content()},
                destinationView: destinationView
            ).toAnyView()
        case .push:
            return NavigationLink {
                destinationView
            } label: {
                content()
            }.toAnyView()
        }
    }
}
