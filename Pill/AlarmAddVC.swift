//
//  AlarmAddVC.swift
//  Pill
//
//  Created by 이정민 on 2022/05/23.
//

import Foundation
import UIKit
import DropDown

class AlarmAddVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleView: UIStackView!
    @IBOutlet weak var soundView: UIStackView!
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var btnSound: UIButton!
    
    
    var alarmManager = AlarmManager()
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleView.layer.cornerRadius = 10
        soundView.layer.cornerRadius = 10
        
        
        tfTitle.placeholder = "알람"
        tfTitle.text = "알람"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func goToList(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindAdd", sender: self)
    }

    // 저장 버튼 클릭 시 호출되는 함수.
    @IBAction func alarmSave(_ sender: Any) {
        var tempAlarm = Alarm()
        tempAlarm.date = datePicker.date
        tempAlarm.title = tfTitle.text ?? "알람"
        tempAlarm.sound = btnSound.titleLabel?.text ?? "Bell"
        
        alarmManager.addAlarm(alarm: tempAlarm)
        alarmManager.sortAlarms()
        
        self.performSegue(withIdentifier: "unwindAdd", sender: self)
    }
    
    @IBAction func dropDown(_ sender: UIButton) {
        dropDown.dataSource = ["Bell", "Cow"]
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal) //9
        }
    }
}
