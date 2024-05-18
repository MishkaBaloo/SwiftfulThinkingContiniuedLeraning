//
//  DownloadingImagesBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 18.05.2024.
//

import SwiftUI

// Codable 
// background threads
// weak self
// Combine
// Piblisher and Subscriber
// FileManager
// NSCache

struct DownloadingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(vm.dataArray) { model in
                   DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images!")
        }
    }
}

#Preview {
    DownloadingImagesBootcamp()
}
