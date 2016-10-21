//
//  OperatorsButton.swift
//  Calculator
//
//  Created by admin on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class OperatorsButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurationButton()
    }
    
    func configurationButton() -> Void {
        
        if tag == 101 {
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 1)
        } else {
            backgroundColor = UIColor.init(red: 116/255, green: 219/255, blue: 110/255, alpha: 1)
        }
        
        layer.cornerRadius = 8.0
        self.setTitleColor(UIColor.white, for: .normal)
        titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 20)
    }

}
