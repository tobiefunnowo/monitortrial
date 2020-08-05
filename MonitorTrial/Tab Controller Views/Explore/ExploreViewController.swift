//
//  ExploreViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 03/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {

    
    @IBOutlet weak var btnEntertainmentAllDay: UIButton!
    @IBOutlet weak var btnUrgeToCreate: UIButton!
    @IBOutlet weak var btnWorkWiser: UIButton!
    @IBOutlet weak var btnMeditate: UIButton!
    
    let detailsView = ExploreDetailsViewController(nibName: "ExploreDetailsViewController", bundle: nil)
    var sentList: [Services]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func handleGoToEntertainment(_ sender: Any) {
        
        setupDetailsView(imageName: "EntertainmentImage", subtitleNAme: "GET STARTED", stringTitle: "Entertainment All Day", textViewContent: ExploreTextContent.entertainmentString)
        
    }
    @IBAction func handleGoToUrgeCreate(_ sender: Any) {
        
		let firstSevice = Services(imageName: "Behancelogo", serviceName: "Behance", servicePrice: "$900", beenSelected: false)
		let secondSevice = Services(imageName: "DSTVlogo", serviceName: "Dribble", servicePrice: "$650", beenSelected: false)
        sentList = []
        sentList?.append(firstSevice)
        sentList?.append(secondSevice)
        setupDetailsView(imageName: "urgeCreateView", subtitleNAme: "STAY UPDATED", stringTitle: "Urge to create?", textViewContent: ExploreTextContent.urgeToCreateString, lsitService: sentList)
        
    }
    @IBAction func handleGoToWorkWiser(_ sender: Any) {
        
		let firstSevice = Services(imageName: "Dropboxlogo", serviceName: "Dropbox", servicePrice: "$600", beenSelected: false)
		let secondSevice = Services(imageName: "AppleTVlogo", serviceName: "Apple TV", servicePrice: "$9,000", beenSelected: false)
        sentList = []
        sentList?.append(firstSevice)
        sentList?.append(secondSevice)

        setupDetailsView(imageName: "workWiserView", subtitleNAme: "STAY EFFICIENT", stringTitle: "Work wiser", textViewContent: ExploreTextContent.workWiserString, lsitService: sentList)
    }
    @IBAction func handleGoToMeditate(_ sender: Any) {
        
		let firstSevice = Services(imageName: "Behancelogo", serviceName: "Zen", servicePrice: "$900", beenSelected: false)
        
        sentList = []
        sentList?.append(firstSevice)

        setupDetailsView(imageName: "healthView", subtitleNAme: "STAY HEALTHY", stringTitle: "Health and wellness", textViewContent: ExploreTextContent.healthString, lsitService: sentList)
    }
    
    
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
