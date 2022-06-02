//
//  SearchVC.swift
//  Pill
//
//  Created by 김은서 on 2022/05/11.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSymptom: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSearch.setNextBtnColor(enabled: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSerch(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
