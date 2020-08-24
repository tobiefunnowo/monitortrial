//
//  ExploreViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

	//var sentIndex:Int = 0
    @IBOutlet weak var tblExplore: UITableView!
    
//    @IBOutlet weak var btnEntertainmentAllDay: UIButton!
//    @IBOutlet weak var btnUrgeToCreate: UIButton!
//    @IBOutlet weak var btnWorkWiser: UIButton!
//    @IBOutlet weak var btnMeditate: UIButton!
//    @IBOutlet weak var optionsStackView: UIStackView!
	
    let detailsView = ExploreDetailsViewController(nibName: "ExploreDetailsViewController", bundle: nil)
    var sentList: [Services]?
	var varyingExploreOptions:[ExploreOptions] = []
	var listOfExploreOptions:[ExploreOptions]{
		let firstOption = ExploreOptions(imageName: "EntertainmentAllDay", imageIndex: 1, goToDetails: {
			let firstSevice = Services(imageName: "Netflixlogo", serviceName: "Netflix", servicePrice: "$11", beenSelected: false)
			let secondSevice = Services(imageName: "Spotify Logo", serviceName: "Spotify", servicePrice: "$10", beenSelected: false)
			let thirdSevice = Services(imageName: "iTunesLogo", serviceName: "iTunes", servicePrice: "$35", beenSelected: false)
			let fourthSevice = Services(imageName: "DSTV logo", serviceName: "DSTV", servicePrice: "$13", beenSelected: false)
			
			self.sentList = []
			self.sentList?.append(firstSevice)
			self.sentList?.append(secondSevice)
			self.sentList?.append(thirdSevice)
			self.sentList?.append(fourthSevice)
			self.setupDetailsView(imageName: "EntertainmentImage", subtitleNAme: "GET STARTED", stringTitle: "Entertainment All Day", textViewContent: ExploreTextContent.entertainmentString,lsitService: self.sentList)
		})
        let secondOption = ExploreOptions(imageName: "EntertainmentAllDay", imageIndex: 2, goToDetails: {
            let firstSevice = Services(imageName: "Behancelogo", serviceName: "Behance", servicePrice: "$900", beenSelected: false)
			let secondSevice = Services(imageName: "DribbleLogo", serviceName: "Dribble", servicePrice: "$650", beenSelected: false)
			self.sentList = []
			self.sentList?.append(firstSevice)
			self.sentList?.append(secondSevice)
			self.setupDetailsView(imageName: "urgeCreateView", subtitleNAme: "STAY UPDATED", stringTitle: "Urge to create?", textViewContent: ExploreTextContent.urgeToCreateString, lsitService: self.sentList)
        })
        let thirdOption = ExploreOptions(imageName: "WorkWiser", imageIndex: 3, goToDetails: {
            let firstSevice = Services(imageName: "Dropboxlogo", serviceName: "Dropbox", servicePrice: "$600", beenSelected: false)
			let secondSevice = Services(imageName: "AppleTVlogo", serviceName: "AppleTV", servicePrice: "$9,000", beenSelected: false)
			self.sentList = []
			self.sentList?.append(firstSevice)
			self.sentList?.append(secondSevice)

			self.setupDetailsView(imageName: "workWiserView", subtitleNAme: "STAY EFFICIENT", stringTitle: "Work wiser", textViewContent: ExploreTextContent.workWiserString, lsitService: self.sentList)
        })
        let fourthOption = ExploreOptions(imageName: "Meditate", imageIndex: 4, goToDetails: {
            let firstSevice = Services(imageName: "Behancelogo", serviceName: "Zen", servicePrice: "$900", beenSelected: false)
			
			self.sentList = []
			self.sentList?.append(firstSevice)

			self.setupDetailsView(imageName: "healthView", subtitleNAme: "STAY HEALTHY", stringTitle: "Health and wellness", textViewContent: ExploreTextContent.healthString, lsitService: self.sentList)
        })
		
		return [firstOption,secondOption,thirdOption,fourthOption]
	}
    
    override func viewDidLoad() {
        super.viewDidLoad()
		tblExplore.delegate = self
		tblExplore.dataSource = self
		tblExplore.backgroundColor = .clear
		tblExplore.tableFooterView = UIView()
		
		varyingExploreOptions.append(listOfExploreOptions[HelperClass.sentIndex])
		for exploreOption in listOfExploreOptions{
			if(varyingExploreOptions[0].imageIndex == exploreOption.imageIndex){
				continue
			}
			varyingExploreOptions.append(exploreOption)
		}
		tblExplore.reloadData()
		
		
        //optionsStackView.add
        // Do any additional setup after loading the view.
    }
	
	override func viewDidLayoutSubviews() {
		  super.viewDidLayoutSubviews()
		  self.tblExplore.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
				
		
//		if sentIndex == 0{
//			optionsStackView.removeArrangedSubview(btnEntertainmentAllDay)
//			optionsStackView.insertArrangedSubview(btnEntertainmentAllDay, at: 0)
//		}else if sentIndex == 1{
//			optionsStackView.removeArrangedSubview(btnUrgeToCreate)
//			optionsStackView.insertArrangedSubview(btnUrgeToCreate, at: 0)
//		}else if sentIndex == 2{
//			optionsStackView.removeArrangedSubview(btnWorkWiser)
//			optionsStackView.insertArrangedSubview(btnWorkWiser, at: 0)
//		}else if sentIndex == 3{
//			optionsStackView.removeArrangedSubview(btnMeditate)
//			optionsStackView.insertArrangedSubview(btnMeditate, at: 0)
//		}
	}
    
    
//    @IBAction func handleGoToEntertainment(_ sender: Any) {
//        
//        setupDetailsView(imageName: "EntertainmentImage", subtitleNAme: "GET STARTED", stringTitle: "Entertainment All Day", textViewContent: ExploreTextContent.entertainmentString)
//        
//    }
//    @IBAction func handleGoToUrgeCreate(_ sender: Any) {
//        
//		let firstSevice = Services(imageName: "Behancelogo", serviceName: "Behance", servicePrice: "$900", beenSelected: false)
//		let secondSevice = Services(imageName: "DribbleLogo", serviceName: "Dribble", servicePrice: "$650", beenSelected: false)
//        sentList = []
//        sentList?.append(firstSevice)
//        sentList?.append(secondSevice)
//        setupDetailsView(imageName: "urgeCreateView", subtitleNAme: "STAY UPDATED", stringTitle: "Urge to create?", textViewContent: ExploreTextContent.urgeToCreateString, lsitService: sentList)
//        
//    }
//    @IBAction func handleGoToWorkWiser(_ sender: Any) {
//        
//		let firstSevice = Services(imageName: "Dropboxlogo", serviceName: "Dropbox", servicePrice: "$600", beenSelected: false)
//		let secondSevice = Services(imageName: "AppleTVlogo", serviceName: "Apple TV", servicePrice: "$9,000", beenSelected: false)
//        sentList = []
//        sentList?.append(firstSevice)
//        sentList?.append(secondSevice)
//
//        setupDetailsView(imageName: "workWiserView", subtitleNAme: "STAY EFFICIENT", stringTitle: "Work wiser", textViewContent: ExploreTextContent.workWiserString, lsitService: sentList)
//    }
//    @IBAction func handleGoToMeditate(_ sender: Any) {
//        
//		let firstSevice = Services(imageName: "Behancelogo", serviceName: "Zen", servicePrice: "$900", beenSelected: false)
//        
//        sentList = []
//        sentList?.append(firstSevice)
//
//        setupDetailsView(imageName: "healthView", subtitleNAme: "STAY HEALTHY", stringTitle: "Health and wellness", textViewContent: ExploreTextContent.healthString, lsitService: sentList)
//    }
    
    
    func setupDetailsView(imageName:String,subtitleNAme:String,stringTitle:String,textViewContent:String, lsitService:[Services]? = nil){
        
        detailsView.imageName = imageName
        detailsView.stringViewTItle = stringTitle
        detailsView.stringVieSubtitle = subtitleNAme
        detailsView.textViewContent = textViewContent
        if let listServices = lsitService{
            detailsView.listOfServices = listServices
        }
        detailsView.modalPresentationStyle = .fullScreen
        detailsView.modalTransitionStyle = .crossDissolve
        self.present(detailsView, animated: true, completion: nil)
    }
    
    
    
    @IBAction func handleGoBack(_ sender: Any) {
        let notifView = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
        self.navigationController?.pushViewController(notifView, animated: true)
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

extension ExploreViewController:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return varyingExploreOptions.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tblExplore.dequeueReusableCell(withIdentifier: "ExploreBtnCell")!
		if let cellimageView = cell.viewWithTag(1000) as? UIImageView{
			cellimageView.image = UIImage(named: varyingExploreOptions[indexPath.row].imageName)
		}
		cell.selectionStyle = .none
		cell.backgroundColor = .clear
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tblExplore.deselectRow(at: indexPath, animated: true)
		varyingExploreOptions[indexPath.row].goToDetails()
	}
	
}
