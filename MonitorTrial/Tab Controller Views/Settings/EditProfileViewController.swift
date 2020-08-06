//
//  EditProfileViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 06/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var mySubview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mySubview.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBAction func handleBAck(_ sender: Any) {
		dismiss(animated: true, completion: nil)
		
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
