//
//  Notifications.swift
//  NSNotification Implementation
//
//  Created by Kenny on 12/22/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//


import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    private var date = Date()
    
    //Request permission to present notifications
    func notificationRequest() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) {
           (didAllow, error) in
           if !didAllow {
               print("User has declined notifications")
           }
       }
    }
    
    private func scheduleNotification(notificationTitle: String) -> UNMutableNotificationContent {
        print("Scheduling")
        let content = UNMutableNotificationContent()
        content.title = notificationTitle
        content.body = "\(notificationTitle) Created"
        content.sound = UNNotificationSound.default
        //content.badge = 1
        
        return content
    }
    
    func triggerNotification(onDate date: Date) {
        self.date = date
        let notificationDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationDate, repeats: false)
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: scheduleNotification(notificationTitle: identifier),
                                            trigger: trigger)
        notificationCenter.add(request) { (error) in
            print("request added for \(date)")
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
