//
//  BasedOnYourLimitsViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 04/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class BasedOnYourLimitsViewController: UIViewController {

	var listOfServices:[Services]!{
		let firstErvice = Services(imageName: "Netflixlogo", serviceName: "Netflix", servicePrice: "$3300")
		let secondService = Services(imageName: "Dropboxlogo", serviceName: "Dropbox", servicePrice: "$660")
		let thirdService = Services(imageName: "Behancelogo", serviceName: "Zen", servicePrice: "$900")
        let fourthService = Services(imageName: "", serviceName: "Total", servicePrice: "$5400")
		return [firstErvice,secondService,thirdService,fourthService]
	}
    @IBOutlet weak var tblServices: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblServices.delegate = self
        tblServices.dataSource = self
        tblServices.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        tblServices.tableFooterView = UIView()
        tblServices.backgroundColor = .clear
        //tblServices.separatorInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        tblServices.separatorStyle = .none
        // Do any additional setup after loading the view.
    }

    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension BasedOnYourLimitsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listOfServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceCell = tblServices.dequeueReusableCell(withIdentifier: "ServiceTableViewCell") as! ServiceTableViewCell
		serviceCell.imgCell.image = UIImage(named: listOfServices[indexPath.row].imageName)
		serviceCell.lblServiceName.text = listOfServices[indexPath.row].serviceName
		serviceCell.lblServicePrice.text = listOfServices[indexPath.row].servicePrice
//        serviceCell.backgroundColor = .clear
        return serviceCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblServices.deselectRow(at: indexPath, animated: true)
    }
    
}
