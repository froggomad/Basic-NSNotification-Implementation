//
//  ViewController.swift
//  NSNotification Implementation
//
//  Created by Kenny on 12/22/19.
//  Copyright © 2019 Hazy Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let notifications = Notifications()
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifications.notificationCenter.delegate = self
        notify(secondsFromNow: 5)
    }

    func notify(secondsFromNow secs: TimeInterval) {
        self.notifications.triggerNotification(onDate: Date(timeIntervalSinceNow: secs))
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    
    //for displaying notification when app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //If you don't want to show notification when app is open, do something here else and make a return here.
        //Even if you don't implement this delegate method, you will not see the notification on the specified controller. So, you have to implement this delegate and make sure the below line executes. i.e. completionHandler.
        completionHandler([.alert, .badge, .sound])
    }
    
}
