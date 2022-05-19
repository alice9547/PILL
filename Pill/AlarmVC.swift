//
//  AlarmViewController.swift
//  Pill
//
//  Created by 이정민 on 2022/05/11.
//

import UIKit

class AlarmVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var alarmTable: UITableView!
    var alarm: Alarm = Alarm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTable.delegate = self
        alarmTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as! AlarmTableViewCell
        cell.title.text = alarm.label
        cell.subtitle.text = alarm.formattedTime
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "알람"
    }
}
