//
//  AlarmAddVC.swift
//  Pill
//
//  Created by 이정민 on 2022/05/23.
//

import Foundation
import UIKit

class AlarmAddVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var alarmAddTableView: UITableView!
    var cellItems = ["이름", "사운드", "다시 알림"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmAddTableView.delegate = self
        alarmAddTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }

    // 테이블 표시 함수.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = alarmAddTableView.dequeueReusableCell(withIdentifier: "AlarmAddTableViewCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = cellItems[indexPath.row]
        cell.contentConfiguration = content
        
        // 스위치 뷰
        let switchView = UISwitch()
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        cell.accessoryView = switchView
        
        return cell

    }
    
    // 스위치 변경 시 호출되는 함수.
    @objc func switchChanged(_ sender: UISwitch!) {
        print("Table row switch changed \(sender.tag)")
        print("The switch is \(sender.isOn ? "ON" : "OFF")")
    }
    
    // 테이블 셀 클릭 시 호출되는 함수.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("indexPath.row is 0")
        case 1:
            print("indexPath.row is 1")
        case 2:
            print("indexPath.row is 2")
        default:
            print("indexPath.row is nil")
        }
    }


}
