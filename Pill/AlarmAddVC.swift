//
//  AlarmAddVC.swift
//  Pill
//
//  Created by 이정민 on 2022/05/23.
//

import Foundation
import UIKit

class AlarmAddVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleView: UIStackView!
    @IBOutlet weak var soundView: UIStackView!
    @IBOutlet weak var repeatView: UIStackView!
    
    var alarmManager = AlarmManager()
    var cellItems = ["이름", "사운드", "다시 알림"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.layer.cornerRadius = 10
        soundView.layer.cornerRadius = 10
        repeatView.layer.cornerRadius = 10
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func goToList(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindAdd", sender: self)
    }

    // 저장 버튼 클릭 시 호출되는 함수.
    @IBAction func alarmAddSave(_ sender: Any) {
        var tempAlarm = Alarm()
        tempAlarm.date = datePicker.date
        tempAlarm.title = "Nice"
        
        alarmManager.addAlarm(alarm: tempAlarm)
        alarmManager.sortAlarms()
        
        self.performSegue(withIdentifier: "unwindAdd", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AlarmVC {
            let nextVC = segue.destination as? AlarmVC
            nextVC?.alarmManager = alarmManager
        }
    }

}
