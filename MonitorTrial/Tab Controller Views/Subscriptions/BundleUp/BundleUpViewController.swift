//
//  BundleUpViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class BundleUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handlePresetBundle(_ sender: Any) {
		let presetView = PresetBundleViewController(nibName: "PresetBundleViewController", bundle: nil)
		presetView.modalPresentationStyle = .formSheet
		present(presetView, animated: true, completion: nil)
    }
    
    
    @IBAction func handleCreateYOurbundle(_ sender: Any) {
		navigationController?.pushViewController(CreatYOurBundleViewController(nibName: "CreatYOurBundleViewController", bundle: nil), animated: true)
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
