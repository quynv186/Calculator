//
//  NumberButton.swift
//  Calculator
//
//  Created by admin on 10/20/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class NumberButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setNumberButton()
    }
    
    func setNumberButton() -> Void {
        backgroundColor = UIColor.init(red: 49/255, green: 58/255, blue: 75/255, alpha: 1)
        
        self.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 18)
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 0.2).cgColor
    }
    
}
