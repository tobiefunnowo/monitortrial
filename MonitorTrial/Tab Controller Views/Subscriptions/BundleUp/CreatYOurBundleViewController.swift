//
//  CreatYOurBundleViewController.swift
//  MonitorTrial
//
//  Created by Ibukunoluwa Soyebo on 05/08/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CreatYOurBundleViewController: UIViewController {

    
    @IBOutlet weak var tblServices: UITableView!
	
    @IBOutlet weak var btnCreateBundle: UIButton!
    
	var selectedServices:[Services] = []
    override func viewDidLoad() {
        super.viewDidLoad()
		tblServices.delegate = self
        tblServices.dataSource = self
        tblServices.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        tblServices.tableFooterView = UIView()
        tblServices.backgroundColor = .clear
        tblServices.separatorStyle = .none
		
		btnCreateBundle.layer.cornerRadius = 10
        btnCreateBundle.backgroundColor = .lightGray
	}

    @IBAction func handleCreateBuncle(_ sender: Any) {
		let ourView = SaveOrSubscribeViewController(nibName: "SaveOrSubscribeViewController", bundle: nil)
		ourView.receivedServices = selectedServices
		navigationController?.pushViewController(ourView, animated: true)
        
    }
    
    @IBAction func handleBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension CreatYOurBundleViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		Services.listOfServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceCell = tblServices.dequeueReusableCell(withIdentifier: "ServiceTableViewCell") as! ServiceTableViewCell
		serviceCell.imgCell.image = UIImage(named: Services.listOfServices[indexPath.row].imageName)
		serviceCell.lblServiceName.text = Services.listOfServices[indexPath.row].serviceName
		serviceCell.lblServicePrice.text = Services.listOfServices[indexPath.row].servicePrice
		serviceCell.selectionStyle = .none
		return serviceCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblServices.deselectRow(at: indexPath, animated: true)
        let theCell = tblServices.cellForRow(at: indexPath)!
		let lightGreen = UIColor(red: 0.16, green: 0.79, blue: 0.25, alpha: 1)
		if theCell.backgroundColor == lightGreen{
			theCell.backgroundColor = .white
			Services.listOfServices[indexPath.row].hasBeenSelected=false
		}else{
			theCell.backgroundColor = lightGreen
			Services.listOfServices[indexPath.row].hasBeenSelected=true
			print(Services.listOfServices[indexPath.row].serviceName)
			print(Services.listOfServices[indexPath.row].hasBeenSelected)

		}
		print(Services.listOfServices[indexPath.row].hasBeenSelected)

		let selectedList = Services.listOfServices.filter{
			element in
			return element.hasBeenSelected == true
		}
			
		selectedServices = selectedList
		if selectedList.count == 0{
			btnCreateBundle.backgroundColor = .lightGray
			btnCreateBundle.isEnabled = false
		}else{
			btnCreateBundle.backgroundColor = .black
			btnCreateBundle.isEnabled = true
		}
		
    }

}
