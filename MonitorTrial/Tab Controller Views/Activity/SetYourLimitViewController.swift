//
//  SetYourLimitViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 04/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class SetYourLimitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func handleGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func handleGoToBAsedonLimits(_ sender: Any) {
        navigationController?.pushViewController(BasedOnYourLimitsViewController(nibName: "BasedOnYourLimitsViewController", bundle: nil), animated: true)
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
