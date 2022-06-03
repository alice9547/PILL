//
//  AlarmViewController.swift
//  Pill
//
//  Created by 이정민 on 2022/05/11.
//

import UIKit
import SwiftyUserDefaults

class AlarmVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var alarmTableView: UITableView!
    
    var alarmManager: AlarmManager = AlarmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTableView.delegate = self
        alarmTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alarmTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmManager.getCount();
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        let alarm = alarmManager.getAlarm(key: indexPath.row)
        cell.title.text = alarm.title
        cell.subtitle.text = alarm.formattedTime
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "알람"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AlarmEditVC {
            let nextVC = segue.destination as? AlarmEditVC
            let indexPath = alarmTableView.indexPathForSelectedRow!.row
            let alarm = alarmManager.getAlarm(key: indexPath)
//            nextVC?.datePicker.date = alarm.date
//            nextVC?.textLabel.text = alarm.title
//            nextVC?.soundLabel.text = alarm.sound

        }
        
        if segue.destination is AlarmAddVC {
            let nextVC = segue.destination as? AlarmAddVC
            nextVC?.alarmManager = self.alarmManager
        }
    }
    
    // Unwind
    @IBAction func unwindAdd(_ segue: UIStoryboardSegue) {
        viewWillAppear(true)
    }
    @IBAction func unwindEdit(_ segue: UIStoryboardSegue) {}

    @IBAction func addButton(_ sender: Any) {
        
    }
    
    
}
