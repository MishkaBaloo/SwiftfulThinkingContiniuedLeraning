//
//  BackgroundThreadBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 16.05.2024.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("CHEK 1: \(Thread.isMainThread)")
            print("CHEK 1: \(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArray = newData
                print("CHEC 2: \(Thread.isMainThread)")
                print("CHEC 2: \(Thread.current)")
            }
        }
    }
    
    func downloadData() -> [String] {
        
        var data: [String] = [] // fake data
        for x in 0..<100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadBootcamp: View {
    
    @StateObject var vm = BackgroundThreadViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 10, content: {
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundStyle(Color.red)
                }
            })
        }
    }
}

#Preview {
    BackgroundThreadBootcamp()
}
