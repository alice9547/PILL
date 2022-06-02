//
//  AlarmManager.swift
//  Pill
//
//  Created by 이정민 on 2022/05/26.
//

import Foundation

class AlarmManager {
    var alarms : [Alarm] = []
    
    func addAlarm(alarm: Alarm) {
        alarms.append(alarm)
    }
    
    func editAlarm(alarm: Alarm) {
        
    }
    
    func getAlarm(key: Int) -> Alarm {
        return alarms[key]
        
    }
    
    func getCount() -> Int {
        return alarms.count
    }
    
    func printAlarms() {
        alarms.forEach {
            print($0)
        }
    }
    
    func sortAlarms() {
        alarms = alarms.sorted(by: {$0.date < $1.date})
    }
    
}
