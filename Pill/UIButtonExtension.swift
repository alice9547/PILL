//
//  Button.swift
//  Pill
//
//  Created by 김은서 on 2022/06/01.
//

import Foundation
import UIKit

extension UIButton{
    
    func setNextBtnColor(enabled : Bool) {
        
        let titleColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        self.isEnabled = enabled
        self.layer.cornerRadius = 8
        self.backgroundColor = isEnabled ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(titleColor, for: .disabled)
    }
    
}
