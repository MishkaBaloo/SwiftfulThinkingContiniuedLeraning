//
//  TimerBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 17.05.2024.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()  // Actually publisher
    
    // Current Time
    /*
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    */
    
    // Countdown
    /*
    @State var count: Int = 10
    @State var finishedText: String? = nil
    */
    
    // Countdown to date
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
        let minute = remaining.minute ?? 0
        let second  = remaining.second ?? 0
        timeRemaining = "\(minute) minutes, \(second) seconds"
    } */
    
    // Animation counter
    @State var count: Int = 1
    
    var body: some View {
        ZStack{
            RadialGradient(
                gradient: Gradient(colors: [Color(uiColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(uiColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
                .ignoresSafeArea()
            
            // Text(dateFormatter.string(from: currentDate)) // Current time
            // Text(finishedText ?? "\(count)") // Countdown
            
//            Text(timeRemaining)
//                .padding()
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundStyle(Color.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 100)
//            .foregroundStyle(Color.white)
            
            TabView(selection: $count,
                    content:  {
                Rectangle()
                    .foregroundStyle(Color.red)
                    .tag(1)
                Rectangle()
                    .foregroundStyle(Color.blue)
                    .tag(2)
                Rectangle()
                    .foregroundStyle(Color.green)
                    .tag(3)
                Rectangle()
                    .foregroundStyle(Color.orange)
                    .tag(4)
                Rectangle()
                    .foregroundStyle(Color.pink)
                    .tag(5)
            })
            .frame(height: 400)
            .tabViewStyle(PageTabViewStyle())
            
        }
        .onReceive(timer, perform: { _ in
            
            //currentDate = value // Current time
            // Countdown
            /*
            if count <= 1 {
                finishedText = "Wow!"
            } else {
                count -= 1
            }
            */
            //updateTimeRemaining() // Countdown to date
            
            withAnimation(.default) {
                count = count == 5 ? 1 : count + 1
            }
        })
    }
}

#Preview {
    TimerBootcamp()
}
