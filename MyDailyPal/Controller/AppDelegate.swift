//
//  AppDelegate.swift
//  MyDailyPal
//
//  Created by Yixin Qi on 9/26/17.
//  Copyright © 2017 Yixin Qi. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // push notification
        UNUserNotificationCenter.current().getNotificationSettings {(settings) in
            if (settings.authorizationStatus == .authorized) {
                print("Notification authorized!")
            } else {
                UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .badge, .alert], completionHandler: { (granted, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if (granted) {
                            print("granted!")
                        }
                    }
                })
            }
        }
        
        // define actions
        let yesAction = UNNotificationAction(identifier: "clickYes", title: "Yes", options: [])
        let noAction = UNNotificationAction(identifier: "clickNo", title: "No", options: [])
        // add actions to category
        let category = UNNotificationCategory(identifier: "yesnoCategory", actions:[yesAction,noAction],intentIdentifiers: [], options: [])
        // add category to notification framework
        UNUserNotificationCenter.current().setNotificationCategories([category])
        return true
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let record = AdherenceRecord(context: PersistenceService.context)
        let body = response.notification.request.content.body
        let body_array = body.split(separator: " ")
        record.treatmentName = String(body_array[8])
        record.date = NSDate()
        //record.sideEffects = [SideEffect]()
        if response.actionIdentifier == "clickYes"{
            //TODO
            let body = response.notification.request.content.body
            print("****Body of notification: "+body)
            print("TREATMENT NAME: "+record.treatmentName!)
            record.didTake = true
            
        }else if response.actionIdentifier == "clickNo"{
            record.didTake = false
        }
        PersistenceService.saveContext()
        completionHandler()
    }
    
    // set notification of treatment plan
    func scheduleNotification(treatment: TreatmentPlan){
        UNUserNotificationCenter.current().delegate = self
        var selectedDate = treatment.startDate as! Date
        //Formatting date of visit details into string for notification
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let contentDate = dateFormatter.string(from: selectedDate)
        
        //Notification Body and content
        // notification 1: You are scheduled to take 1 tablet(s) of ABACAVIR 600 at 2:30 PM With Meal.
        // notification 2: You are scheduled to take 1 tablet(s) of ABACAVIR 600 at 2:30 PM With Meal.
        // did you take this medication today?
        let contentBody_before = "You are scheduled to take \(treatment.noOfTablet) tablet(s) of \(treatment.medication ?? "") at \(treatment.startDate!)"
        
        let contentBody_now = contentBody_before+" Did you take this medication today?"
        let content_before = UNMutableNotificationContent()
        content_before.title = "MyDailyPal"
        content_before.body = contentBody_before
        
        let content_onTime = UNMutableNotificationContent()
        content_onTime.title = "MyDailyPal"
        content_onTime.body = contentBody_now
        content_onTime.categoryIdentifier = "yesnoCategory"
        
        //Creating the timestamps for when the reminders should fire (day before and hour before)
        let minutesBeforeReminder = Calendar.current.date(byAdding: .minute, value: -15, to: selectedDate)
        let minutesBeforeComps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: minutesBeforeReminder!)
        let onTimeReminder = Calendar.current.date(byAdding: .hour, value: 0, to: selectedDate)
        let onTimeComps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: onTimeReminder!)
        
        var minutesBeforeTrigger: UNCalendarNotificationTrigger
        var onTimeTrigger: UNCalendarNotificationTrigger
        //Creating the triggers based off of these timestamps
        if (treatment.repeate != "" || treatment.repeate != nil){
            minutesBeforeTrigger = UNCalendarNotificationTrigger(dateMatching: minutesBeforeComps, repeats: true)
            onTimeTrigger = UNCalendarNotificationTrigger(dateMatching: onTimeComps, repeats: true)
        } else {
            minutesBeforeTrigger = UNCalendarNotificationTrigger(dateMatching: minutesBeforeComps, repeats: false)
            onTimeTrigger = UNCalendarNotificationTrigger(dateMatching: onTimeComps, repeats: false)
        }
        
        
        //Scheduling 15 minutes before medication
        let minutesBeforeNotificationRequest = UNNotificationRequest(identifier: "minutesBeforeTreatment", content: content_before, trigger: minutesBeforeTrigger)
        UNUserNotificationCenter.current().add(minutesBeforeNotificationRequest){ (error) in
            if let error = error {
                print(error)
            } else {
                print("minutes Before Notification Scheduled");
            }
        }
        
        //Scheduling on time medication
        let onTimeNotificationRequest = UNNotificationRequest(identifier: "onTimeTreatment", content: content_onTime, trigger: onTimeTrigger)
        UNUserNotificationCenter.current().add(onTimeNotificationRequest){ (error) in
            if let error = error {
                print(error)
            } else {
                print("ontime Before Notification Scheduled");
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        PersistenceService.saveContext()
    }
    


}

