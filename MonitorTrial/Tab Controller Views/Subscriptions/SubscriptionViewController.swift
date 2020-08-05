//
//  SubscriptionViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class SubscriptionViewController: UIViewController {

    
    @IBOutlet weak var tblSubscriptions: UITableView!
    @IBOutlet weak var collviewUpcoming: UICollectionView!
    
    var listOfUpcomingImages:[String]{
        return ["CubeBehance","CubeDribbble","CubeDSTV","CubeiTunes"]
    }
    
	var listOfSubscriptionImages: [String]{
		return ["AppleTvCell","BehanceCell","DribbleCell","DroboxSubCell","DSTVCell","iTunesCell","NetflixCell","SpotifySubCell"]
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		collviewUpcoming.delegate = self
		collviewUpcoming.dataSource = self
		tblSubscriptions.delegate = self
		tblSubscriptions.dataSource = self
		collviewUpcoming.backgroundColor = .clear
		tblSubscriptions.backgroundColor = .clear
		tblSubscriptions.register(UINib(nibName: "FullImageTableViewCell", bundle: nil), forCellReuseIdentifier: "FullImageTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func hanldeAddSub(_ sender: Any) {
		
        navigationController?.pushViewController(AddSubscriptionsViewController(nibName: "AddSubscriptionsViewController", bundle: nil), animated: true)
    }
    

}

//MARK:TABLEVIEW
extension SubscriptionViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		listOfSubscriptionImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let fullImageCell = tblSubscriptions.dequeueReusableCell(withIdentifier: "FullImageTableViewCell") as! FullImageTableViewCell
		fullImageCell.fullImageView.image = UIImage(named: listOfSubscriptionImages[indexPath.row])
		return fullImageCell
    }
    
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tblSubscriptions.deselectRow(at: indexPath, animated: true)
	}
}


//MARK:COLLECETION VIEW
extension SubscriptionViewController:UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listOfUpcomingImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let upcomngCell = collviewUpcoming.dequeueReusableCell(withReuseIdentifier: "UpcoingCell", for: indexPath)
        if let collimageView = upcomngCell.viewWithTag(1000) as? UIImageView{
            collimageView.image = UIImage(named: listOfUpcomingImages[indexPath.row])
        }
        return upcomngCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collviewUpcoming.frame.size.width/2, height: collviewUpcoming.frame.size.height)
    }
}
