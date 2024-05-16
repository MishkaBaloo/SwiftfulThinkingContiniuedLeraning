//
//  EscapingBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 16.05.2024.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
    }
    
    func doSomething(_ data: String) -> () { // Void - same thing as ()
        // forData - external name, example like _ in previous func
        print(data)
    }
    
    func downloadData() -> String { // fake data
        return "New data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ()) {
        completionHandler("New data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
            //this is the best version of coding with using typealias
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    EscapingBootcamp()
}
