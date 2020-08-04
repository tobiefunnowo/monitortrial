//
//  AddCardViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 04/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import PKHUD

class AddCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    } 


    @IBAction func btnBAck(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSaveCard(_ sender: Any) {
        HUD.show(.progress)
		DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let successView = SuccessViewController(nibName: "SuccessViewController", bundle: nil)
			self.navigationController?.pushViewController(successView, animated: true)
            
        }
    }
}
