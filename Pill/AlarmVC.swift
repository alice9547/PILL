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
        cell.title.text = alarm.formattedTime
        cell.subtitle.text = alarm.title
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
            nextVC?.alarmManager = alarmManager
            nextVC?.indexPath = indexPath

        }
        
        if segue.destination is AlarmAddVC {
            let nextVC = segue.destination as? AlarmAddVC
            nextVC?.alarmManager = self.alarmManager
        }
    }
    
    
    //테이블 뷰 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            alarmManager.alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
    
    // Unwind
    @IBAction func unwindAdd(_ segue: UIStoryboardSegue) {
        viewWillAppear(true)
    }
    @IBAction func unwindEdit(_ segue: UIStoryboardSegue) {
        viewWillAppear(true)
    }

    @IBAction func addButton(_ sender: Any) {
        
    }
    
    
}
