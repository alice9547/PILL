//
//  AlarmManager.swift
//  Pill
//
//  Created by 이정민 on 2022/05/26.
//

import Foundation
//import SwiftyUserDefaults
import CloudKit

class AlarmManager {
    var alarms : [Alarm] = []
    
    func addAlarm(alarm: Alarm) {
        alarms.append(alarm)
    }
    
    func editAlarm(at: Int, alarm: Alarm) {
        alarms[at].title = alarm.title
        alarms[at].date = alarm.date
        alarms[at].sound = alarm.sound
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
    
//    func getDate() -> DateComponents {
//        var dates = Array<DateComponents>
//        
//    }
    
//    func saveAlarm(alarm: Alarm) {
//        let encoder = JSONEncoder()
//        // Data 인코딩 후 UserDefaults 저장.
//        if let encoded = try? encoder.encode(alarm) {
//            let strId : String = String(Defaults.id)
//            Defaults.alarms = [strId : encoded]
//            print(Defaults.alarms?.values)
//            Defaults.id += 1
//        }
//    }
    
//    func loadAlarm() {
//        alarms.removeAll()
//        Defaults.alarms?.forEach({ (key: String, value: Any) in
//            let decoder = JSONDecoder()
//            if let savedAlarm = try? decoder.decode(Alarm.self, from: value as! Data) {
//                alarms.append(savedAlarm)
//                print(key)
//                print(value)
//            }
//        })
//
//        if let savedData = Defaults.alarms?[key] as? Data {
//            let decoder = JSONDecoder()
//            if let savedAlarm = try? decoder.decode(Alarm.self, from: savedData) {
//                alarms.append(savedAlarm)
//                print(alarms)
//            }
//        }
//    }
    
}

//

//extension DefaultsKeys {
//    var id: DefaultsKey<Int> { .init("id", defaultValue: 0) }
//    var alarms: DefaultsKey<[String: Any]?> { .init("alarms") }
//}
