//
//  ContentView.swift
//  28.01.2025
//
//  Created by Vadim Vinogradov on 1/28/25.
//

import SwiftUI

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
   
    var body: some View {
//       1. AsyncImage(url: URL(string: imageURL))
        
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                // Показываем placeholder
                ProgressView() // Индикатор загрузки
            case .success(let image):
                // Показываем загруженное изображение
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                // Показываем сообщение об ошибке
                Image(systemName: "xmark.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.red)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ContentView()
}
