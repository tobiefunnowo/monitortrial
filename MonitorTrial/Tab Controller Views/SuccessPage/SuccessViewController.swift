//
//  SuccessViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 04/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import PKHUD
class SuccessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		HUD.hide()
	}

    @IBAction func btnReturnToActivity(_ sender: Any) {
		
		let storyBoard = UIStoryboard(name: "Main", bundle: nil)
		if #available(iOS 13.0, *) {
			let myView = storyBoard.instantiateViewController(identifier: "ExploreTab")
			myView.modalPresentationStyle = .fullScreen
			myView.modalTransitionStyle = .crossDissolve
			self.present(myView, animated: true, completion: nil)
		} else {
			// Fallback on earlier versions
		}
		
		
//        if let destinationController = navigationController?.viewControllers.filter({$0 is ActivityViewController}).first{
//            navigationController?.popToViewController(destinationController, animated: true)
//        }
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
