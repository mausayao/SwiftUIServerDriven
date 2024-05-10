//
//  CarouselView.swift
//  SwiftUIServerDriven
//
//  Created by Maurício Sayão on 01/05/24.
//

import Foundation
import SwiftUI

struct CarouselView: View {
    
    let uiModel: CarouselUIModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(uiModel.items) { item in
                    Navigator.perform(action: uiModel.action, payload: item) {
                        AsyncImage(url: item.imageUrl) { imaage in
                            imaage
                                .resizable()
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }.toAnyView()
                    }
                }
            }
        }
    }
}
