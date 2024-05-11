//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 11.05.2024.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            ScrollView{
                TextField("Enter a # ...", text: $textFieldText)
                    .frame(height: 55)
                    .border(Color.gray)
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
                
                Button("SCROLL NOW") {
                    withAnimation(.spring()) {
                        if let index = Int(textFieldText) {
                            scrollToIndex = index
                        }
                    }

                }
                
                
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(.rect(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
//                    .onChange(of: scrollToIndex, perform: { value in // deprecated
//
//                    })
                    
                        .onChange(of: scrollToIndex) { oldValue, newValue in
                            withAnimation(.spring) {
                                proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}
