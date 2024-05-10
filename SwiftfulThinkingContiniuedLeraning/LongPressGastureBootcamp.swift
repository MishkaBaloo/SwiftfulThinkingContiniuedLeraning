//
//  LongPressGastureBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 10.05.2024.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        // try to merge fork with xcode
        VStack{
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        // at the mon duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { (isPressing) in
                        // start of press -> min duration
                        if isPressing {
                            withAnimation(.easeIn(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                       isComplete = false
                                    }
                                }
                            }
                        }
                    }

                
                Text("RESET")
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(.rect(cornerRadius: 10))
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
//        Text(isComplete ? "COMPLETED" : "NOT COMPLETED")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .clipShape(.rect(cornerRadius: 10))
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 3.0,maximumDistance: 50, perform: {
//                isComplete.toggle()
//            })
        
    }
}

#Preview {
    LongPressGestureBootcamp()
}
