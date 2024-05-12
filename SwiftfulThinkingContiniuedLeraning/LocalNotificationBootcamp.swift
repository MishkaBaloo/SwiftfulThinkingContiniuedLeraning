//
//  LocalNotificationBootcamp.swift
//  SwiftfulThinkingContiniuedLeraning
//
//  Created by Michael on 12.05.2024.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    
    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SECCESS")
            }
        }
    }
    
    func sheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!"
        content.subtitle = "This was sooooo easy!"
        content.sound = .default
        content.badge = 1
        
        // time
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 8
//        dateComponents.minute = 0
//        dateComponents.weekday = 1
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // location
        let coordinates = CLLocationCoordinate2D(
            latitude: 40.00,
            longitude: 50.00)
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 100,
            identifier: UUID().uuidString)
        
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
}

struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40, content: {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule permission") {
                NotificationManager.instance.sheduleNotification()
            }
            Button("Cancel permission") {
                NotificationManager.instance.cancelNotification()
            }
        })
        .onAppear(perform: {
            UNUserNotificationCenter.current().setBadgeCount(0)
        })
    }
}

#Preview {
    LocalNotificationBootcamp()
}
