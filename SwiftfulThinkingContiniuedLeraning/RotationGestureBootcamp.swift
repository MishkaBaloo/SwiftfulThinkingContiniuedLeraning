//
//  RotationGestureBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 10.05.2024.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .padding(50)
            .background(Color.blue.clipShape(.rect(cornerRadius: 10)))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded{ value in
                        withAnimation(.spring) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
        
    }
}

#Preview {
    RotationGestureBootcamp()
}
