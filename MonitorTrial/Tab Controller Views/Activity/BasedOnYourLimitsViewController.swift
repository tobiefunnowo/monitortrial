//
//  BasedOnYourLimitsViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 04/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class BasedOnYourLimitsViewController: UIViewController {

    @IBOutlet weak var tblServices: UITableView!
	var setPriceLimit = 0
	var myListofServices:[Services] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
        tblServices.delegate = self
        tblServices.dataSource = self
        tblServices.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        tblServices.tableFooterView = UIView()
        tblServices.backgroundColor = .clear
        //tblServices.separatorInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        tblServices.separatorStyle = .none
		createPriceRange(limit: setPriceLimit)
        // Do any additional setup after loading the view.
    }

    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleCreateBundle(_ sender: Any) {
		navigationController?.pushViewController(SaveOrSubscribeViewController(nibName: "SaveOrSubscribeViewController", bundle: nil), animated: true)
    }
	
	func createPriceRange(limit:Int){
		var total = 0
		var functionCount = 0
		
		while (total < limit) {
			let thisService = Services.listOfServices[functionCount]
			functionCount += 1
			if functionCount == 8{
				break
			}
			
			let priceInt = Int(thisService.servicePrice.replacingOccurrences(of: "$", with: ""))
			if let unwrapped_priceInt = priceInt{
				if unwrapped_priceInt + total > limit{
					continue
				}
				total += unwrapped_priceInt
				myListofServices.append(thisService)
			}
			
		}
		tblServices.reloadData()
	}
	
//	func createPriceRange(limit:Int){
//		let randomIndex = Int.random(in: 0...Services.listOfServices.count)
//		var total = 0
//		var functionCount = 0
//
//		while (total < limit) {
//			functionCount += 1
//			if functionCount == 12{
//				break
//			}
//			let thisService = Services.listOfServices[randomIndex]
//			if thisService.hasBeenSelected{
//				continue
//			}
//			let priceInt = Int(thisService.servicePrice.replacingOccurrences(of: "$", with: ""))
//			if let unwrapped_priceInt = priceInt{
//				total += unwrapped_priceInt
//			}
//			if thisService.hasBeenSelected == false{
//				myListofServices.append(thisService)
//				thisService.hasBeenSelected = true
//			}
//		}
//		tblServices.reloadData()
//	}
}

extension BasedOnYourLimitsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myListofServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceCell = tblServices.dequeueReusableCell(withIdentifier: "ServiceTableViewCell") as! ServiceTableViewCell
		serviceCell.imgCell.image = UIImage(named: myListofServices[indexPath.row].imageName)
		serviceCell.lblServiceName.text = myListofServices[indexPath.row].serviceName
		serviceCell.lblServicePrice.text = myListofServices[indexPath.row].servicePrice
//        serviceCell.backgroundColor = .clear
        return serviceCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblServices.deselectRow(at: indexPath, animated: true)
    }
    
}
