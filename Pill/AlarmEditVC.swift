//
//  AlarmEditVC.swift
//  Pill
//
//  Created by 이정민 on 2022/05/24.
//

import UIKit
import DropDown

class AlarmEditVC: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var soundView: UILabel!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var btnSound: UIButton!
    
    var alarmManager = AlarmManager()
    var indexPath: Int = 0
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tempAlarm = alarmManager.getAlarm(key: indexPath)
        
        titleView.layer.cornerRadius = 10
        soundView.layer.cornerRadius = 10
        
        datePicker.date = tempAlarm.date
        tfTitle.placeholder = "알람"
        tfTitle.text = tempAlarm.title
        btnSound.setTitle(tempAlarm.sound, for: .normal)
        
    }
    @IBAction func editAlarm(_ sender: Any) {
        var tempAlarm = Alarm()
        tempAlarm.title = tfTitle.text ?? "알람"
        tempAlarm.date = datePicker.date
        tempAlarm.sound = btnSound.titleLabel?.text ?? "Bell"
        
        alarmManager.editAlarm(at: indexPath, alarm: tempAlarm)
        self.performSegue(withIdentifier: "unwindEdit", sender: self)
    }
    
    @IBAction func goToList(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindEdit", sender: self)
    }

    @IBAction func btnDelete(_ sender: Any) {
        alarmManager.alarms.remove(at: indexPath)
        self.performSegue(withIdentifier: "unwindEdit", sender: self)
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
