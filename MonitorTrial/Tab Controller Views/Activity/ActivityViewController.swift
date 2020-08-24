//
//  ActivityViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 04/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import SafariServices


class ActivityViewController: UIViewController {

    @IBOutlet weak var cardCollection: UICollectionView!
    let cardImageNames = ["blueCard","yellowCard"]
    @IBOutlet weak var spendOnBudgetView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardCollection.delegate = self
        cardCollection.dataSource = self
        //cardCollection.backgroundColor = .clear
        spendOnBudgetView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    

    @IBAction func handleGoToBudgetPlan(_ sender: Any) {
		navigationController?.pushViewController(SpendOnBudgetViewController(nibName: "SpendOnBudgetViewController", bundle: nil), animated: true)
    }
    
    @IBAction func btnAddCard(_ sender: Any) {
        
		let url = URL(string: HelperClass.sampleURLforCard)
		if let url = url {
			let safari = SFSafariViewController(url: url)
			self.present(safari, animated: true, completion: nil)
		}
        
        
//        let adCardView = AddCardViewController(nibName: "AddCardViewController", bundle: nil)
//        navigationController?.pushViewController(adCardView, animated: true)
    }
    
}

extension ActivityViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cardImageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collCell = cardCollection.dequeueReusableCell(withReuseIdentifier: "CardCollectionItem", for: indexPath)
        
        if let cardImage = collCell.viewWithTag(200) as? UIImageView{
            cardImage.image = UIImage(named: cardImageNames[indexPath.row])
            cardImage.contentMode = .scaleAspectFit
        }
        
        return collCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cardCollection.frame.size.width, height: cardCollection.frame.size.height)
    }
    
}
