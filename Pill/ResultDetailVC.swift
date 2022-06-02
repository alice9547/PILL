//
//  ResultDetailVC.swift
//  Pill
//
//  Created by 김은서 on 2022/05/11.
//

import UIKit

class ResultDetailVC: UIViewController {
    
    var paramPill: PillModelElement?

    @IBOutlet weak var imgPill: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEfficacy: UILabel!
    @IBOutlet weak var lblAppearance: UILabel!
    @IBOutlet weak var lblUses: UILabel!
    @IBOutlet weak var lblPrecaution: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let paramPill = self.paramPill else {return}
        
        lblName.text = paramPill.productName
        lblEfficacy.text = paramPill.efficacy
        lblAppearance.text = paramPill.appearance
        lblUses.text = paramPill.uses
        lblPrecaution.text = paramPill.precaution
        
    
    }
    
}
