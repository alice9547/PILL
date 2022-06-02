//
//  AlarmEditVC.swift
//  Pill
//
//  Created by 이정민 on 2022/05/24.
//

import UIKit

class AlarmEditVC: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToList(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindEdit", sender: self)
    }

}
