//
//  CustomButton.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit

public class myButtons:UIButton{
    
    var tapped:Bool = true
    var originalColor:UIColor!
    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        self.layer.cornerRadius = 10
        originalColor = self.backgroundColor
        self.addTarget(self, action: #selector(changeColor), for: .touchUpInside)

    }
    
    @objc func changeColor(){
        
        if tapped{
            self.backgroundColor = UIColor(red: 0/255, green: 125/255, blue: 17/255, alpha: 1)
        }else{
            self.backgroundColor = originalColor
        }
        tapped.toggle()
    }
}
