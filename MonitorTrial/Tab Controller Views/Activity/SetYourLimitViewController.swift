//
//  SetYourLimitViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 04/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import PKHUD

class SetYourLimitViewController: UIViewController {

    
    @IBOutlet var priceButtonsCollection: [myButtons]!
    var priceRanges = [20,50,100,150,200]
    var selectedPRiceRange = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
		var tag = 0
		for button in priceButtonsCollection {
			button.tag = tag
			tag += 1
		}
        // Do any additional setup after loading the view.
    }


    @IBAction func handleGoBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func handleGoToBAsedonLimits(_ sender: Any) {
		if selectedPRiceRange == 0{
			HUD.flash(.label("Select a Price Range"),delay: 1)
			return
		}
		let basedView = BasedOnYourLimitsViewController(nibName: "BasedOnYourLimitsViewController", bundle: nil)
		basedView.setPriceLimit = selectedPRiceRange
        navigationController?.pushViewController(basedView, animated: true)
    }
	
    @IBAction func handleGroupButtonSelected(_ sender: myButtons) {
        priceButtonsCollection.forEach({$0.backgroundColor = $0.originalColor})
		sender.backgroundColor = UIColor(red: 0/255, green: 125/255, blue: 17/255, alpha: 1)
        selectedPRiceRange = priceRanges[sender.tag]
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
