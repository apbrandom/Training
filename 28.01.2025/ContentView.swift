//
//  ContentView.swift
//  28.01.2025
//
//  Created by Vadim Vinogradov on 1/28/25.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .padding(40)
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.pn"
    
    var body: some View {
        //       1. AsyncImage(url: URL(string: imageURL))
        
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                // Показываем placeholder
                ProgressView() // Индикатор загрузки
            case .success(let image):
                // Показываем загруженное изображение
                image.imageModifier()
            case .failure:
                // Показываем сообщение об ошибке
                Image(systemName: "xmark.circle").iconModifier()
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
