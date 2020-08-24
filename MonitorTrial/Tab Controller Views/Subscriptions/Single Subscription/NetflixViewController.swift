//
//  NetflixViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class NetflixViewController: UIViewController {

    @IBOutlet weak var subImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNarration: UILabel!
    @IBOutlet weak var imgSubCell: UIImageView!
	var mySingleSubAsset:SingleSubscriptionAsset!
    override func viewDidLoad() {
        super.viewDidLoad()
		subImage.image = UIImage(named: mySingleSubAsset.mainImage)
		imgSubCell.image = UIImage(named: mySingleSubAsset.cellImage)
		lblTitle.text = mySingleSubAsset.title.uppercased()
        lblTitle.textColor = mySingleSubAsset.subColor
		
    }

    @IBAction func goToSuccess(_ sender: Any) {
        let viewSucces =  SuccessViewController(nibName: "SuccessViewController", bundle: nil)
        viewSucces.modalPresentationStyle = .fullScreen
        self.present(viewSucces, animated: true, completion: nil)
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
