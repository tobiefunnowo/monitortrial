//
//  SaveOrSubscribeViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import RealmSwift

class SaveOrSubscribeViewController: UIViewController {
    
	var receivedServices:[Services] = [Services.listOfServices[0],Services.listOfServices[1],Services.listOfServices[2],Services.listOfServices[3]]
    @IBOutlet weak var tblServices: UITableView!
    
    
    @IBOutlet weak var btnSubtoBund: UIButton!
    @IBOutlet weak var btnSaveBundToList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        btnSubtoBund.layer.cornerRadius = 10
        btnSaveBundToList.layer.cornerRadius = 10
        btnSaveBundToList.layer.borderColor = UIColor.black.cgColor
        btnSaveBundToList.layer.borderWidth = 1
        tblServices.delegate = self
        tblServices.dataSource = self
		tblServices.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        tblServices.tableFooterView = UIView()
        tblServices.backgroundColor = .clear
        tblServices.separatorStyle = .none
        // Do any additional setup after loading the view.
    }

    
    @IBAction func handleBAck(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func handleSubscribe(_ sender: Any) {
        let successView = SuccessViewController(nibName: "SuccessViewController", bundle: nil)
        self.navigationController?.pushViewController(successView, animated: true)

    }
    
    @IBAction func handleBundle(_ sender: Any) {
		
		do{
			let myRealm = try Realm()
			let userArray = myRealm.objects(MonitorTrialUsers.self)
			let theUser = userArray.first{
				element in element.EmailAddress == HelperClass.userEmailAddres
			}
			try myRealm.write{
				if let theUser = theUser{
					for selectedService in receivedServices{
						theUser.myServices.append(selectedService)
					}
				}
			}
			let successView = SuccessViewController(nibName: "SuccessViewController", bundle: nil)
			self.navigationController?.pushViewController(successView, animated: true)
			
		}catch(let error){
			print(error.localizedDescription)
		}
		
        
    }
}

extension SaveOrSubscribeViewController:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			receivedServices.count
		}
		
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let serviceCell = tblServices.dequeueReusableCell(withIdentifier: "ServiceTableViewCell") as! ServiceTableViewCell
			serviceCell.imgCell.image = UIImage(named: receivedServices[indexPath.row].imageName)
			serviceCell.lblServiceName.text = receivedServices[indexPath.row].serviceName
			serviceCell.lblServicePrice.text = receivedServices[indexPath.row].servicePrice
            serviceCell.backgroundColor =  UIColor(red: 0.16, green: 0.79, blue: 0.25, alpha: 1)
	//        serviceCell.backgroundColor = .clear
			return serviceCell
		}
		
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			tblServices.deselectRow(at: indexPath, animated: true)
		}
}
