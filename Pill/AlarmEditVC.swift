//
//  AlarmEditVC.swift
//  Pill
//
//  Created by 이정민 on 2022/05/24.
//

import UIKit

class AlarmEditVC: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var soundLabel: UILabel!
    @IBOutlet weak var switchLabel: UISwitch!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var soundView: UILabel!
    @IBOutlet weak var repeatView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleView.layer.cornerRadius = 10
        soundView.layer.cornerRadius = 10
        repeatView.layer.cornerRadius = 10
        
        let titleViewTaps = UITapGestureRecognizer(target: self, action: #selector(self.titleTapGesture(_:)))
        self.titleView.addGestureRecognizer(titleViewTaps)
        
        let soundViewTaps = UITapGestureRecognizer(target: self, action: #selector(self.soundTapGesture(_:)))
        self.soundView.addGestureRecognizer(soundViewTaps)
    }
    
    @IBAction func goToList(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindEdit", sender: self)
    }

    @IBAction func btnDelete(_ sender: Any) {
        
    }
    
    @objc func titleTapGesture(_ geture: UITapGestureRecognizer) {
        print("Hello1")
    }
    
    @objc func soundTapGesture(_ geture: UITapGestureRecognizer) {
        print("Hello1")
    }
    
}
