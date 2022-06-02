//
//  AlarmModel.swift
//  Alarm-ios-swift
//
//  Created by longyutao on 15-2-28.
//  Updated on 17-01-24
//  Copyright (c) 2015年 LongGames. All rights reserved.
//

import Foundation
import MediaPlayer

struct Alarm {
    var title: String = "Alarm"
    var date: Date = Date()
    var enabled: Bool = false
    var mediaLabel: String = "bell"
    var repeatOn: Bool = false
    
    init(){}
    
    init(label: String, date: Date, enabled: Bool, mediaLabel: String, repeatOn: Bool){
        self.title = label
        self.date = date
        self.enabled = enabled
        self.mediaLabel = mediaLabel
        self.repeatOn = repeatOn
    }
    
//    init(_ dict: PropertyReflectable.RepresentationType){
//        title = dict["label"] as! String
//        date = dict["date"] as! Date
//        enabled = dict["enabled"] as! Bool
//        mediaLabel = dict["mediaLabel"] as! String
//        repeatOn = dict["repeatOn"] as! Bool
//    }
    
    static var propertyCount: Int = 5
}

extension Alarm {
    var formattedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self.date)
    }
}

//This can be considered as a viewModel
//class Alarms: Persistable {
//    let ud: UserDefaults = UserDefaults.standard
//    let persistKey: String = "myAlarmKey"
//    var alarms: [Alarm] = [] {
//        //observer, sync with UserDefaults
//        didSet{
//            persist()
//        }
//    }
//
//    private func getAlarmsDictRepresentation()->[PropertyReflectable.RepresentationType] {
//        return alarms.map {$0.propertyDictRepresentation}
//    }
//
//    init() {
//        alarms = getAlarms()
//    }
//
//    func persist() {
//        ud.set(getAlarmsDictRepresentation(), forKey: persistKey)
//        ud.synchronize()
//    }
//
//    func unpersist() {
//        for key in ud.dictionaryRepresentation().keys {
//            UserDefaults.standard.removeObject(forKey: key.description)
//        }
//    }
//
//    var count: Int {
//        return alarms.count
//    }
//
//    //helper, get all alarms from Userdefaults
//    private func getAlarms() -> [Alarm] {
//        let array = UserDefaults.standard.array(forKey: persistKey)
//        guard let alarmArray = array else{
//            return [Alarm]()
//        }
//        if let dicts = alarmArray as? [PropertyReflectable.RepresentationType]{
//            if dicts.first?.count == Alarm.propertyCount {
//                return dicts.map{Alarm($0)}
//            }
//        }
//        unpersist()
//        return [Alarm]()
//    }
//}
