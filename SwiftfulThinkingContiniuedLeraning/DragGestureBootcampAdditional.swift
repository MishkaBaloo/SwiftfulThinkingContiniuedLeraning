//
//  DragGestureBootcampAdditional.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 11.05.2024.
//

import SwiftUI

struct DragGestureBootcampAdditional: View {
    
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.83
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                DragGesture()
                    .onChanged({ value in
                        withAnimation(.spring) {
                            currentDragOffsetY = value.translation.height
                        }
                    })
                    .onEnded({ value in
                        withAnimation(.spring) {
                            if currentDragOffsetY < -350 {
                                endingOffsetY = -startingOffsetY
                                currentDragOffsetY = 0
                            } else if endingOffsetY != 0 && currentDragOffsetY > 350 {
                                endingOffsetY = 0
                                currentDragOffsetY = 0
                            } else {
                                currentDragOffsetY = 0
                            }
                        }
                    })
                )
            
            Text("\(currentDragOffsetY)")
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureBootcampAdditional()
}

struct MySignUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sign up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("This is the description for our app. This is my favorite SiwftUI course and I recommend to all of my friends to subscribe to Swiftful Thinking!")
                .multilineTextAlignment(.center)
            
            Text("Create an account".uppercased())
                .foregroundStyle(Color.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.clipShape(.rect(cornerRadius: 10)))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 30))
    }
}
