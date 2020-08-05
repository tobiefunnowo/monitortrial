//
//  ADdSubscriptionsViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class AddSubscriptionsViewController: UIViewController {

    
    @IBOutlet weak var btnBundleUp: UIButton!
    @IBOutlet weak var btnSingleSub: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBundleUp.layer.cornerRadius = 10
        btnSingleSub.layer.cornerRadius = 10
        btnSingleSub.layer.borderColor = UIColor.black.cgColor
        btnSingleSub.layer.borderWidth = 2
        // Do any additional setup after loading the view.
    }


    
    @IBAction func handleBundleUp(_ sender: Any) {
		navigationController?.pushViewController(BundleUpViewController(nibName: "BundleUpViewController", bundle: nil), animated: true)
    }
    
    @IBAction func hanldeSingleSub(_ sender: Any) {
		navigationController?.pushViewController(SingleSubViewController(nibName: "SingleSubViewController", bundle: nil), animated: true)
    }
    
    
    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
