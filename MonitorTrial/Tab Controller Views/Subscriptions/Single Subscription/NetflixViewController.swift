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
    
	@IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
		let touchPoint = sender.location(in: view?.window)
		var initialTouchPoint = CGPoint.zero

		switch sender.state {
		case .began:
			initialTouchPoint = touchPoint
		case .changed:
			if touchPoint.y > initialTouchPoint.y {
				//view.frame.origin.y = touchPoint.y - initialTouchPoint.y
			}
		case .ended, .cancelled:
			dismiss(animated: true, completion: nil)

//			if touchPoint.y - initialTouchPoint.y > 200 {
//			} else {
//				UIView.animate(withDuration: 0.2, animations: {
//					self.view.frame = CGRect(x: 0,
//											 y: 0,
//											 width: self.view.frame.size.width,
//											 height: self.view.frame.size.height)
//				})
//			}
		case .failed, .possible:
			break
		}
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
