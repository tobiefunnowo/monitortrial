//
//  ViewController.swift
//  MonitorTrial
//
//  Created by MAC on 27/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import RealmSwift

class LoginOrSignUpViewController: UIViewController{
    
    var imageNames = ["screenicon","optimizeicon","budgeticon"]
    var imageTexts = ["Track and monitor all your subscriptions all in one place.","Optimize your subscription services. Discover better services to suit your needs.","Discover new and convenient means to subscribe to your favorite services on a budget. "]
    
    @IBOutlet weak var collviewSignUp: UICollectionView!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var signUpPageControl: UIPageControl!
    @IBOutlet weak var curvedCardView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		//let realm = try! Realm()
		//print(Realm.Configuration.defaultConfiguration.fileURL!)
        collviewSignUp.dataSource = self
        collviewSignUp.delegate = self
        curvedCardView.layer.cornerRadius = 15
        btnLogin.layer.borderWidth = 2
        btnLogin.layer.borderColor = UIColor.black.cgColor
        btnLogin.layer.cornerRadius = 15
        btnSignUp.layer.cornerRadius = 15
		fillTheServices()
		fillTheAssets()
    }

	func fillTheServices(){
		if !Services.listOfServices.isEmpty {
			return
		}
		let service_1 = Services(imageName: "Netflixlogo", serviceName: "Netflix", servicePrice: "$11", beenSelected: false)
		let service_2 = Services(imageName: "Dropboxlogo", serviceName: "Dropbox", servicePrice: "$70", beenSelected: false)
		let service_3 = Services(imageName: "Behancelogo", serviceName: "Zen", servicePrice: "$60", beenSelected: false)
		let servie_4 = Services(imageName: "iTunesLogo", serviceName: "iTunes", servicePrice: "$35", beenSelected: false)
		let service_5 = Services(imageName: "Behancelogo", serviceName: "Behance", servicePrice: "$40", beenSelected: false)
		let sercice_6 = Services(imageName: "Spotify Logo", serviceName: "Spotify", servicePrice: "$10", beenSelected: false)
		let service_7 = Services(imageName: "AppleTVlogo", serviceName: "AppleTV", servicePrice: "$90", beenSelected: false)
		let service_8 = Services(imageName: "playstationlogo", serviceName: "PlaystationPlus", servicePrice: "$70", beenSelected: false)
		
		Services.listOfServices.append(service_1)
		Services.listOfServices.append(service_2)
		Services.listOfServices.append(service_3)
		Services.listOfServices.append(servie_4)
		Services.listOfServices.append(service_5)
		Services.listOfServices.append(sercice_6)
		Services.listOfServices.append(service_7)
		Services.listOfServices.append(service_8)
	}
	
	func fillTheAssets(){
		if !SingleSubscriptionAsset.lisOfSingleSubAssets.isEmpty{
			return
		}
		let asset_1 = SingleSubscriptionAsset(mainImage: "mainImageNetflix", cellImage: "NetflixCell", logoImageName: "", title: "Netflix", subColor: .red)
		let asset_2 = SingleSubscriptionAsset(mainImage: "mainDropboxImage", cellImage: "DroboxSubCell", logoImageName: "", title: "Dropbox", subColor: .blue)
		let asset_3 = SingleSubscriptionAsset(mainImage: "mainDribble", cellImage: "DribbleCell", logoImageName: "", title: "Dribble", subColor: .systemPink)
		let asset_4 = SingleSubscriptionAsset(mainImage: "mainZenImage", cellImage: "ZenCell", logoImageName: "", title: "Zen", subColor: .blue)
		let asset_5 = SingleSubscriptionAsset(mainImage: "mainBehance", cellImage: "BehanceCell", logoImageName: "", title: "Behance", subColor: .blue)
		let asset_6 = SingleSubscriptionAsset(mainImage: "mainItunes", cellImage: "iTunesCell", logoImageName: "", title: "iTunes", subColor: .red)
		let asset_7 = SingleSubscriptionAsset(mainImage: "mainSpotify", cellImage: "SpotifySubCell", logoImageName: "", title: "Spotify", subColor: .green)
		let asset_8 = SingleSubscriptionAsset(mainImage: "mainAppleTV", cellImage: "AppleTvCell", logoImageName: "", title: "AppleTV", subColor: .black)
		let asset_9 = SingleSubscriptionAsset(mainImage: "mainDstv", cellImage: "DSTVCell", logoImageName: "", title: "DSTV", subColor: .blue)
		SingleSubscriptionAsset.lisOfSingleSubAssets = [asset_1,asset_2,asset_3,asset_4,asset_5,asset_6,asset_7,asset_8,asset_9]
	}
    

}

extension LoginOrSignUpViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collCell = collviewSignUp.dequeueReusableCell(withReuseIdentifier: "SignUpCell", for: indexPath)
        if let label = collCell.viewWithTag(2000) as? UILabel{
            label.text = imageTexts[indexPath.row]
        }
        if let collImageView = collCell.viewWithTag(1000) as? UIImageView{
            collImageView.image = UIImage(named: imageNames[indexPath.row])
            collImageView.contentMode = .scaleAspectFit
            
        }
        return collCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collviewSignUp.frame.size.width, height: collviewSignUp.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        signUpPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

